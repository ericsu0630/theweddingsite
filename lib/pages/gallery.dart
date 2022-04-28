import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tsu_and_angel/styles/colors.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  ScrollController scrollController = ScrollController();
  ValueNotifier<List<dynamic>> imageList = ValueNotifier([]);
  ValueNotifier<bool> showLoading = ValueNotifier(true);
  String? pageToken;
  Reference storageRef = FirebaseStorage.instance.ref();

  @override
  void initState() {
    //load the first batch of images
    fetchInitialData();

    //keeps track of where the user is scrolling
    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
        //load more images when bottom of page is reached
        fetchMoreData();
      }
    });
    super.initState();
  }

  void fetchInitialData() async {
    //create a file reference to the firebase cloud storage folder
    Reference fileRef = storageRef.child("Wedding photos original");

    //load the first 50 images
    ListResult listResult = await fileRef.list(ListOptions(maxResults: 50));

    //keep track of how many 'pages' have been loaded
    pageToken = listResult.nextPageToken;

    //the actual list of image data returned from firebase
    List<Reference> imageReferences = listResult.items;

    //build list of references to fetch image download URL
    List<Future<String>> imgUrlFutures = List.empty(growable: true);
    for (Reference imageReference in imageReferences) {
      imgUrlFutures.add(imageReference.getDownloadURL());
    }

    //fetches all 50 image URLs concurrently
    List<String> imgUrlList = await Future.wait(imgUrlFutures);

    //update the UI
    imageList.value = imgUrlList;

    //hide loading indicator once data has been confirmed
    if (imageList.value.isNotEmpty) {
      showLoading.value = false;
    }
  }

  Future<void> fetchMoreData() async {
    showLoading.value = true;
    //create a file reference to the firebase cloud storage folder
    Reference fileRef = storageRef.child("Wedding photos original");

    //load the next 50 images using pageToken as a 'bookmark'
    ListResult listResult = await fileRef.list(ListOptions(maxResults: 50, pageToken: pageToken));

    //update the 'bookmark'
    pageToken = listResult.nextPageToken;

    //the actual list of image data returned from firebase
    List<Reference> imageReferences = listResult.items;

    //build list of references to fetch image download URL
    List<Future<String>> imgUrlFutures = List.empty(growable: true);
    for (Reference imageReference in imageReferences) {
      imgUrlFutures.add(imageReference.getDownloadURL());
    }

    //fetch all 50 image URLs concurrently
    List<String> imgUrlList = await Future.wait(imgUrlFutures);

    //update the UI
    if (imgUrlList.isNotEmpty) {
      imageList.value += imgUrlList;
      showLoading.value = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_rounded, color: Palette.primary),
          iconSize: 32.0,
        ),
        centerTitle: true,
        title: AutoSizeText(
          'Gallery',
          style: TextStyle(
            fontSize: 32,
            color: Palette.primary,
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: pageBody(),
    );
  }

  Widget pageBody() {
    return ValueListenableBuilder(
        valueListenable: imageList,
        builder: (context, List<dynamic> imageList, _) {
          return Stack(
            children: [
              if (imageList.isNotEmpty)
                MasonryGridView.count(
                  controller: scrollController,
                  itemCount: imageList.length,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  // the number of columns
                  crossAxisCount: 6,
                  // vertical gap between two items
                  mainAxisSpacing: 16,
                  // horizontal gap between two items
                  crossAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return Image.network(
                      imageList[index],
                      fit: BoxFit.fitWidth,
                    );
                  },
                ),
              ValueListenableBuilder(
                  valueListenable: showLoading,
                  builder: (context, bool showLoading, _) {
                    if (showLoading) {
                      return Center(child: CircularProgressIndicator(color: Palette.primary));
                    } else {
                      return Container();
                    }
                  }),
            ],
          );
        });
  }
}

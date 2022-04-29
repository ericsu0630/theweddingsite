import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tsu_and_angel/styles/colors.dart';
import 'dart:math' as math;
import 'dart:developer' as console;

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  ScrollController scrollController = ScrollController();
  ValueNotifier<List<dynamic>> imageList = ValueNotifier([]);
  ValueNotifier<bool> showLoading = ValueNotifier(true);
  bool endOfListReached = false;
  bool initialized = false;
  String? pageToken;
  Reference storageRef = FirebaseStorage.instance.ref();

  @override
  void initState() {
    //load the first batch of images
    fetchData();

    //keeps track of where the user is scrolling
    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
        //load more images when bottom of page is reached
        fetchData();
      }
    });
    super.initState();
  }

  Future<void> fetchData() async {
    if (endOfListReached) return;
    showLoading.value = true;
    //create a file reference to the firebase cloud storage folder
    Reference fileRef = storageRef.child("Eric test photos");

    //load the next 50 images using pageToken as a 'bookmark'
    ListResult listResult = await fileRef.list(ListOptions(maxResults: 50, pageToken: pageToken));

    //update the 'bookmark'
    pageToken = listResult.nextPageToken;

    if (pageToken == null && initialized) {
      showLoading.value = false;
      endOfListReached = true;
      console.log("end of image list");
      return;
    }

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
      console.log("total number of images loaded: ${imageList.value.length.toString()}");
      showLoading.value = false;
      initialized = true;
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
                MasonryGridView.builder(
                  controller: scrollController,
                  itemCount: imageList.length,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  // the number of columns
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
                  // vertical gap between two items
                  mainAxisSpacing: 16,
                  // horizontal gap between two items
                  crossAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return Container(color: Colors.grey, height: (math.Random().nextDouble() * 500) + 200);
                    return Image.network(
                      imageList[index],
                      filterQuality: FilterQuality.medium,
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

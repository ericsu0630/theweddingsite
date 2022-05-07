import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tsu_and_angel/styles/colors.dart';
import 'dart:developer' as console;

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  ScrollController scrollController = ScrollController();
  List<Widget> imageList = [];
  List<String> pathToHighResImage = [];
  ValueNotifier<bool> showLoading = ValueNotifier(true);
  //bool endOfListReached = false;
  bool initialized = false;
  String? pageToken;
  Reference storageRef = FirebaseStorage.instance.ref();

  @override
  void initState() {
    //load the first batch of images
    fetchData();

    //keeps track of where the user is scrolling
    scrollController.addListener(() {
      if (scrollController.offset >= scrollController.position.maxScrollExtent - 300) {
        //load more images when bottom of page is reached
        fetchData();
      }
    });
    super.initState();
  }

  Future<void> fetchData() async {
    //if (endOfListReached) return;
    showLoading.value = false;
    //setState(() {});
    //create a file reference to the firebase cloud storage folder
    //Reference fileRef = storageRef.child("Final photo resized");

    //load the next 50 images using pageToken as a 'bookmark'
    // ListResult listResult = await fileRef.list(ListOptions(maxResults: 50, pageToken: pageToken));

    //update the pageToken
    // pageToken = listResult.nextPageToken;

    if (pageToken == null && initialized) {
      showLoading.value = false;
      //endOfListReached = true;
      console.log("end of image list");
      //setState(() {});
      return;
    }

    //the actual list of image data returned from firebase
    // List<Reference> imageReferences = listResult.items;

    //build list of references to fetch image download URL
    // List<Future<String>> imgUrlFutures = List.empty(growable: true);
    // for (Reference imageReference in imageReferences) {
    // imgUrlFutures.add(imageReference.getDownloadURL());
    // }

    //fetch all 50 image URLs concurrently
    // List<String> imgUrls = await Future.wait(imgUrlFutures);

    // Override for local development - remove later
    List<String> imgUrls = List.empty(growable: true);

    for (int i = 1; i <= 10; i++) {
      imgUrls.add("low_res_photos/TSUSHIUAN_ANGEL_BELAIR_WEDDING_$i.jpg");
    }

    for (String url in imgUrls) {
      Image image = Image.asset(
        url,
        key: ValueKey(url),
        filterQuality: FilterQuality.medium,
        fit: BoxFit.fill,
      );

      //i think this code below fixed the shuffling problem?

      image.image.resolve(ImageConfiguration()).addListener(
        ImageStreamListener(
          (info, call) {
            // print(info.sizeBytes);
            // print(image.key.toString());
            double aspectRatio = info.image.width.toDouble() / info.image.height.toDouble();
            imageList.add(AspectRatio(aspectRatio: aspectRatio, child: image));
            String temp_path = image.key.toString();
            temp_path = temp_path.substring(3, temp_path.length - 3);
            temp_path = temp_path.replaceFirst("low", "high");
            pathToHighResImage.add(temp_path);
            //showLoading.value = false;
            //setState(() {});
          },
        ),
      );

      //precacheImage(image.image, context);
      //await Future.delayed(Duration(milliseconds: 100)); //give some time for each image to precache

    }

    //update the UI
    if (imgUrls.isNotEmpty) {
      print("total number of images loaded: ${imageList.length.toString()}");
      initialized = true;
      //setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = (deviceWidth / 300).round().toInt();
    if (crossAxisCount < 2) {
      crossAxisCount = 2;
    } else if (crossAxisCount > 6) {
      crossAxisCount = 6;
    }
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
      body: Stack(
        children: [
          if (imageList.isNotEmpty)
            MasonryGridView.count(
              controller: scrollController,
              itemCount: imageList.length,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              // the number of columns
              crossAxisCount: crossAxisCount,
              // vertical gap between two items
              mainAxisSpacing: 16,
              // horizontal gap between two items
              crossAxisSpacing: 16,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: imageList[index],
                  onTap: () {
                    //todo run a method that downloads full res photo
                    print(pathToHighResImage[index]);
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        insetPadding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: StatefulBuilder(builder: (context, imageState) {
                                Image highResImage = Image.asset(
                                  pathToHighResImage[index],
                                  key: ValueKey(pathToHighResImage[index]),
                                  filterQuality: FilterQuality.medium,
                                  fit: BoxFit.fill,
                                );
                                Widget aspectRatioHighResImage = Container();
                                showLoading.value = true;
                                //setState(() {});
                                highResImage.image.resolve(ImageConfiguration()).addListener(
                                  ImageStreamListener(
                                    (info, call) {
                                      double aspectRatio = info.image.width.toDouble() / info.image.height.toDouble();
                                      aspectRatioHighResImage = AspectRatio(aspectRatio: aspectRatio, child: highResImage);
                                      showLoading.value = false;
                                      imageState(() {});
                                    },
                                  ),
                                );
                                return aspectRatioHighResImage;
                              }),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  size: 32.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ValueListenableBuilder(
              valueListenable: showLoading,
              builder: (context, bool showLoading, _) {
                if (showLoading)
                  return Center(child: CircularProgressIndicator(color: Palette.primary));
                else
                  return Container();
              }),
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tsu_and_angel/photo_list.dart';
import 'package:tsu_and_angel/styles/colors.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  ScrollController scrollController = ScrollController();
  List<Widget> imageList = [];
  ValueNotifier<bool> showLoading = ValueNotifier(true);

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    final List<String> imgUrls = List.empty(growable: true);
    for (int i = 0; i < photoList.length; i++) {
      imgUrls.add('assets/low_res_photos/${photoList[i]}.jpg');
    }

    for (final String url in imgUrls) {
      final Image image = Image.asset(
        url,
        key: ValueKey(url),
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
      );

      image.image.resolve(ImageConfiguration.empty).addListener(
        ImageStreamListener(
          (info, call) {
            final double aspectRatio = info.image.width.toDouble() / info.image.height.toDouble();
            imageList.add(AspectRatio(aspectRatio: aspectRatio, child: image));
            if (showLoading.value == true) {
              showLoading.value = false;
            }
            if (mounted) setState(() {});
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = (deviceWidth / 300).round();
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
          'Photo Gallery',
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
              padding: const EdgeInsets.all(8.0),
              // the number of columns
              crossAxisCount: crossAxisCount,
              // vertical gap between two items
              mainAxisSpacing: 8,
              // horizontal gap between two items
              crossAxisSpacing: 8,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: imageList[index],
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        insetPadding: const EdgeInsets.all(16.0),
                        backgroundColor: Colors.transparent,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: InteractiveViewer(minScale: 1.0, maxScale: 2.0, child: imageList[index]),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.arrow_back_rounded, color: Colors.white),
                              ),
                              iconSize: 32.0,
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
              if (showLoading) {
                return Center(child: CircularProgressIndicator(color: Palette.primary));
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}

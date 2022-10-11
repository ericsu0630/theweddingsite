import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:tsu_and_angel/styles/colors.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<dynamic> lowResImgUrls = [];
  List<dynamic> highResImgUrls = [];
  @override
  void initState() {
    for (int i = 1; i <= 229; i++) {
      lowResImgUrls.add('assets/low_res_photos/TSUSHIUAN_ANGEL_BELAIR_WEDDING_$i.jpg');
      highResImgUrls.add('assets/high_res_photos/TSUSHIUAN_ANGEL_BELAIR_WEDDING_$i.jpg');
    }
    super.initState();
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
      body: MasonryGridView.builder(
        itemCount: lowResImgUrls.length,
        padding: const EdgeInsets.all(8.0),
        // the number of columns
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount),
        // vertical gap between two items
        mainAxisSpacing: 8,
        // horizontal gap between two items
        crossAxisSpacing: 8,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: FadeInImage.memoryNetwork(
              fadeOutDuration: const Duration(milliseconds: 250),
              fadeInDuration: const Duration(milliseconds: 250),
              fadeInCurve: Curves.easeOutCubic,
              placeholder: kTransparentImage,
              image: lowResImgUrls[index].toString(),
              fit: BoxFit.fill,
              imageErrorBuilder: (context, error, stackTrace) => Container(),
              placeholderErrorBuilder: (context, error, stackTrace) => Container(),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: InteractiveViewer(
                      minScale: 1.0, //min zoom
                      maxScale: 5.0, //max zoom
                      child: Image.asset(
                        highResImgUrls[index].toString(),
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) => Container(),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

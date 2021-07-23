import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';

class ContentCardStart extends StatelessWidget {
  final List<Widget> contentList;
  final String titleText;
  const ContentCardStart({Key? key, required this.contentList, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //account for different screen sizes
    double width = min(MediaQuery.of(context).size.width, 750);
    double height = MediaQuery.of(context).size.height;
    double ratio = MediaQuery.of(context).size.width / height;
    double pcScreenRatio = 16 / 9;
    double tabletScreenRatio = 4 / 3;
    double marginWidth = 0.02;
    if (ratio > tabletScreenRatio) {
      marginWidth = 0.35;
    }
    if (ratio > pcScreenRatio) {
      marginWidth = 0.4;
    }

    contentList.insert(0, SizedBox(height: 16.0));
    contentList.insert(0, Text(titleText, style: MyFonts.contentTitleText));

    return Container(
      constraints: BoxConstraints(maxWidth: width),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: MediaQuery.of(context).size.width * marginWidth),
      //vertical and
      // horizontal
      // margins
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), //space inside the cards
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5), //opacity of the card
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contentList,
      ),
    );
  }
}

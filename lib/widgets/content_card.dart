import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';

class ContentCard extends StatelessWidget {
  final List<Widget> contentList;
  final String titleText;
  const ContentCard({Key? key, required this.contentList, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //account for different screen sizes
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double ratio = width / height;
    double pcScreenRatio = 16 / 9;
    double tabletScreenRatio = 4 / 3;
    double cardWidth = 0.8;
    if (ratio > tabletScreenRatio) {
      cardWidth = 0.6;
    }
    if (ratio > pcScreenRatio) {
      cardWidth = 0.4;
    }

    contentList.insert(0, SizedBox(height: 16.0));
    contentList.insert(0, Text(titleText, style: MyFonts.contentTitleText));

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0), //space between cards
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), //space inside the cards
      width: MediaQuery.of(context).size.width * cardWidth, //width of the cards as calculated above
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.45), //opacity of the card
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: contentList,
      ),
    );
  }
}

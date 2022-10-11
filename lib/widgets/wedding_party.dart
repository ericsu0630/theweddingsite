import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';

class WeddingParty extends StatelessWidget {
  const WeddingParty({Key? key, required this.memberList}) : super(key: key);
  final List<Widget> memberList;
  static ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    //account for different screen sizes
    final double width = min(MediaQuery.of(context).size.width, 750);
    final double height = MediaQuery.of(context).size.height;
    final double ratio = width / height;
    const double pcScreenRatio = 16 / 9;
    const double tabletScreenRatio = 1;
    double marginWidth = 0.1;
    if (ratio > tabletScreenRatio) {
      marginWidth = 0.28;
    }
    if (ratio > pcScreenRatio) {
      marginWidth = 0.33;
    }
    return Container(
      //vertical and horizontal margins
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: width * marginWidth),
      padding: const EdgeInsets.symmetric(vertical: 16.0), //space inside the cards
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        children: [
          AutoSizeText(
            'Wedding Party',
            style: MyFonts.contentTitleText,
          ),
          SizedBox(
            height: 160.0,
            width: width,
            child: Center(
              child: Scrollbar(
                thumbVisibility: true,
                controller: scrollController,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  children: memberList,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget member({required String title, required String name, required String imagePath}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            name,
            style: MyFonts.contentTextDarker,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            title,
            style: MyFonts.contentTextBold,
          ),
        ],
      ),
    );
  }
}

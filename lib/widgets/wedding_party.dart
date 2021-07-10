import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';

class WeddingParty extends StatelessWidget {
  final List<Widget> memberList;
  const WeddingParty({Key? key, required this.memberList}) : super(key: key);
  static ScrollController scroll_controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    //account for different screen sizes
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double ratio = width / height;
    double pcScreenRatio = 16 / 9;
    double tabletScreenRatio = 1;
    double marginWidth = 0.02;
    if (ratio > tabletScreenRatio) {
      marginWidth = 0.2;
    }
    if (ratio > pcScreenRatio) {
      marginWidth = 0.25;
    }
    return Container(
      //vertical and horizontal margins
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: MediaQuery.of(context).size.width * marginWidth),
      padding: const EdgeInsets.symmetric(vertical: 16.0), //space inside the cards
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        children: [
          Text(
            'Wedding Party',
            style: MyFonts.contentTitleText,
          ),
          Container(
            height: 160.0,
            child: Center(
              child: Scrollbar(
                isAlwaysShown: true,
                controller: scroll_controller,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: memberList,
                  controller: scroll_controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static member({required String title, required String name, required String imagePath}) {
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

import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/colors.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';

class WeddingParty extends StatelessWidget {
  final List<Widget> memberList;
  const WeddingParty({Key? key, required this.memberList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //vertical and horizontal margins
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 24.0), //space inside the cards
      color: Colors.white.withOpacity(0.5),
      child: Column(
        children: [
          Text(
            'Wedding Party',
            style: MyFonts.contentTitleText,
          ),
          Container(
            height: 160.0,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: memberList,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static member({required String title, required String name, required String imagePath}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            name,
            style: MyFonts.contentText,
          ),
          Expanded(
            child: CircleAvatar(
              radius: 56.0,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
          Text(
            title,
            style: MyFonts.contentText,
          ),
        ],
      ),
    );
  }
}

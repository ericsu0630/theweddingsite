import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';
import 'package:tsu_and_angel/widgets/background_image.dart';
import 'package:tsu_and_angel/widgets/content_card.dart';
import 'package:tsu_and_angel/widgets/google_map.dart';
import 'package:tsu_and_angel/widgets/navigation_bar.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late AnimationController _titleAnimationController;
  late Animation<double> _titleAnimation;

  @override
  void initState() {
    super.initState();
    _titleAnimationController = AnimationController(
        duration: const Duration(milliseconds: 1000), value: 0, lowerBound: 0, upperBound: 1, vsync: this);
    _titleAnimation = CurvedAnimation(parent: _titleAnimationController, curve: Curves.fastOutSlowIn);
    _titleAnimationController.forward();
  }

  @override
  void dispose() {
    _titleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageBody(),
    );
  }

  Widget pageBody() {
    return Scrollbar(
      controller: scrollController,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: <Widget>[
            NavBar(
              selectedPosition: 2,
            ),
            splashScreen(),
          ],
        ),
      ),
    );
  }

  String text_1 =
      "Lemoenskloof \nOlive Tree Lodge\nMadeliefie Guest Accommodation\n20 min from Stellenbosch central \n30min from Franschhoek central";
  String text_2 = "";

  Widget splashScreen() {
    return Container(
      child: Stack(
        children: <Widget>[
          backgroundImage1(context),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    FadeTransition(
                      opacity: _titleAnimation,
                      child: ContentCard(
                        titleText: 'Accommodation',
                        contentList: [
                          Text(
                            text_1,
                            style: MyFonts.contentText,
                          ),
                        ],
                      ),
                    ),
                    FadeTransition(
                      opacity: _titleAnimation,
                      child: ContentCard(
                        titleText: 'Directions',
                        contentList: [
                          MyGoogleMap(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

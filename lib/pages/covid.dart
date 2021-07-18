import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';
import 'package:tsu_and_angel/widgets/background_image.dart';
import 'package:tsu_and_angel/widgets/content_card.dart';
import 'package:tsu_and_angel/widgets/navigation_bar.dart';

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> with TickerProviderStateMixin {
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
              selectedPosition: 3,
            ),
            splashScreen(),
          ],
        ),
      ),
    );
  }

  Widget splashScreen() {
    return Container(
      child: Stack(
        children: <Widget>[
          backgroundImage1(context),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: FadeTransition(
                opacity: _titleAnimation,
                child: ContentCard(
                  titleText: 'Covid Safety',
                  contentList: [
                    Text(
                      "With the COVID-19 pandemic being a reality in our world, we’ve made few adjustments to ensure you are as safe from viral transmission as possible.\n\n\n "
                      "We will have a hand sanitization station as well as a temperature check as you arrive. \n\n\n "
                      "Where possible, we will attempt to seat guests from the same household or similar friends groups together and"
                      " provide enough spacing between seats.",
                      style: MyFonts.contentText,
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

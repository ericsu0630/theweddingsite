import 'package:auto_size_text/auto_size_text.dart';
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
      duration: const Duration(milliseconds: 1000),
      value: 0,
      vsync: this,
    );
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
            const NavBar(selectedPosition: 2),
            splashScreen(),
          ],
        ),
      ),
    );
  }

  String text_1 =
      'For more affordable accommodation, Lemoenskloof is a neighbourhood in Paarl, 10-15 minutes drive from the wedding venue. There is a whole host of options, the Olive Tree Lodge and Madeliefie Guest Accommodation to name a few.\n\nFor those looking to fit in a sneaky round of golf or just enjoy the magnificent views it offers, a weekend stay in or around Pearl Valley on Val de Vie Estate may be too good an opportunity to pass up. Slightly more affordable is also Devondale golf and wine estate, which is just under 20 minutes away.\n\nIf a weekend of relaxation and adventure is what you are keen for, a stay in the winelands may be just what you need. Stellenbosch central is a mere 20 minutes drive away. Franschhoek central (where the wine tram is located) is a little further, approximately 30 minutes from the wedding venue. However, you will pass by majority of the wine farms and accommodations on the way there, with the first only 11 minutes away.';
  String text_2 = '';

  Widget splashScreen() {
    return Stack(
      children: <Widget>[
        backgroundImage(context),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Align(
              child: Column(
                children: [
                  FadeTransition(
                    opacity: _titleAnimation,
                    child: ContentCard(
                      titleText: 'Accommodation',
                      contentList: [
                        AutoSizeText(
                          text_1,
                          style: MyFonts.contentText,
                        ),
                      ],
                    ),
                  ),
                  FadeTransition(
                    opacity: _titleAnimation,
                    child: ContentCard(
                      titleText: 'Directions to wedding venue!',
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
    );
  }
}

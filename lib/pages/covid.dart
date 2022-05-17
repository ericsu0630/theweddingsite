import 'package:auto_size_text/auto_size_text.dart';
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
            const NavBar(selectedPosition: 4),
            splashScreen(),
          ],
        ),
      ),
    );
  }

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
                      titleText: 'Covid Safety',
                      contentList: [
                        AutoSizeText(
                          'With the COVID-19 pandemic being a reality in our world, we are committed to keeping our guests as safe from viral transmission as possible. There will be a mandatory hand sanitization station and temperature check upon arrival for all guests. Where possible, we will attempt to seat guests from the same household or similar friends groups together. \n\n '
                          'Since the start of this pandemic, our lives have been plagued with uncertainties. Unfortunately our wedding is no different. With covid in the mix, this continues to be a fluid situation so please keep an eye on this website for any updates pertaining to our special day. \n\n '
                          'If you have any questions or concerns, please do not hesitate to contact us.',
                          style: MyFonts.contentText,
                        ),
                      ],
                    ),
                  ),
                  FadeTransition(
                    opacity: _titleAnimation,
                    child: ContentCard(
                      titleText: "Y'ello!",
                      contentList: [
                        AutoSizeText(
                          'Thank you for being interested and making it this far! As a reward for your tenacity (unfortunately, this will only benefit the out of towners), here are some additional tips and todos!',
                          style: MyFonts.contentText,
                        ),
                        AutoSizeText(
                          'Markets and more',
                          style: MyFonts.contentTextSubtitle,
                        ),
                        AutoSizeText(
                          'R44, Mojo, Lourensford (Sunday), Oranjezicht, VnA food market, Old Biscuit Mill, Boschendal (Friday)\n',
                          style: MyFonts.contentText,
                        ),
                        AutoSizeText(
                          'Hiking - (time to work off all that food you’ll be eating at the wedding!) - there are too many to list, contact us for some suggestions you’re interested :)\n Other - Kirstenbosch Botanical Gardens, Bo-Kaap, Penguins at Boulders Bay (Simons Town), Kalk Bay, Cape Point\n',
                          style: MyFonts.contentText,
                        ),
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

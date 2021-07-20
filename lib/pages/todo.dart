import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';
import 'package:tsu_and_angel/widgets/background_image.dart';
import 'package:tsu_and_angel/widgets/content_card.dart';
import 'package:tsu_and_angel/widgets/content_card_start.dart';
import 'package:tsu_and_angel/widgets/google_map.dart';
import 'package:tsu_and_angel/widgets/navigation_bar.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> with TickerProviderStateMixin {
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

  String text_1 =
      "Alpaca loom (feed the Alpacas!!!)\nThe Spice Route \nFairview Wine and Cheese\nPearl Valley\nDrakenstein Lion Park\nAfrikaans Language Monument (Taal monument)\nGroot Drakenstein Prison\nAshia Cheetah Sanctuary";
  String text_2 = "";

  Widget splashScreen() {
    return Container(
      child: Stack(
        children: <Widget>[
          backgroundImage(context),
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
                        titleText: 'Immediate surrounding area',
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
                      child: ContentCardStart(
                        titleText: 'Slightly further out',
                        contentList: [
                          AutoSizeText(
                            "Winelands",
                            style: MyFonts.contentTextSubtitle,
                          ),
                          AutoSizeText(
                            "Franschhoek: check out Franschhoek wine tram, Babylonstoren, Farm Sanctuary SA\nStellenbosch: strawberry picking, R44 market\nConstantia Valley\n",
                            style: MyFonts.contentText,
                          ),
                          AutoSizeText(
                            "Cape Town CBD",
                            style: MyFonts.contentTextSubtitle,
                          ),
                          AutoSizeText(
                            "V and A Waterfront (incl Robben Island, Ferris wheel etc)\nCamps Bay\nHout Bay\nSignal Hill\nCity Sightseeing Bus\n",
                            style: MyFonts.contentText,
                          ),
                          AutoSizeText(
                            "Alcohol!",
                            style: MyFonts.contentTextSubtitle,
                          ),
                          AutoSizeText(
                            "Gin - Wilderer, Classic Cats, The Botanical Bar, The Gin Bar\nBeer - Cape Brewing Company, Wild Clover Farm, Stellenbaru Microbrewery, Craft Wheat and Hops, Tuk Tuk microbrewery (Franschhoek), Devil’s Peak\n",
                            style: MyFonts.contentText,
                          ),
                          AutoSizeText(
                            "Markets",
                            style: MyFonts.contentTextSubtitle,
                          ),
                          AutoSizeText(
                            "R44, Mojo, Lourensford (Sunday), Oranjezicht, VnA food market, Old Biscuit Mill, Boschendal (Friday)\n",
                            style: MyFonts.contentText,
                          ),
                          AutoSizeText(
                            "Miscellaneous",
                            style: MyFonts.contentTextSubtitle,
                          ),
                          AutoSizeText(
                            "Hiking - (time to work off all that food you’ll be eating at the wedding!) - there are too many to list, contact us for some suggestions you’re interested :)\n Other - Kirstenbosch Botanical Gardens, Bo-Kaap, Penguins at Boulders Bay (Simons Town), Kalk Bay, Cape Point\n",
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
      ),
    );
  }
}

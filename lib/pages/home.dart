import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';
import 'package:tsu_and_angel/widgets/background_image.dart';
import 'package:tsu_and_angel/widgets/content_card.dart';
import 'package:tsu_and_angel/widgets/navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
    return Column(
      children: <Widget>[
        NavBar(
          selectedPosition: 0,
        ),
        pageContent(),
      ],
    );
  }

  Widget pageContent() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double ratio = width / height;
    double pcScreenRatio = 4 / 3;

    String date_time_string = "Thursday, 14 October 2021\nStart time : 14:00 for 14:30\nEnd time : till curfew :(";
    String venue_string = "Belair Pavillion\nSuid Agter Paarl Road\nPaarl, Cape Town\nWestern Cape\n9357";
    String program_string = "";
    // 14:00
    // Guest arrival
    // Ceremony
    //
    // 15:00
    // Drinks and Canapés
    // Photos
    // Lawn games
    //
    // 17:30
    // Wedding party photos
    // Reception
    // Speeches
    // First Dance
    //
    // 20:00
    // Dance floor opens
    //
    // 22:00
    // Home time
    //
    // Wedding party
    // One picture each
    //
    // Registry
    String gps_link = "https://g.page/Belairweddings";
    return Container(
      height: MediaQuery.of(context).size.height - 64,
      child: Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height - 64,
                    child: Image.asset(
                      (ratio > pcScreenRatio) ? 'assets/images/picture_1.JPG' : 'assets/images/picture_3.JPG',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned.fill(
                    bottom: 128.0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FadeTransition(
                        opacity: _titleAnimation,
                        child: ElevatedButton(
                          //RSVP button styling
                          style: ElevatedButton.styleFrom(
                            elevation: 8.0,
                            primary: Colors.white,
                            side: BorderSide(color: Colors.black87, width: 2.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'More',
                                  style: MyFonts.contentTitleText,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black87,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            scrollController.animateTo(MediaQuery.of(context).size.height,
                                duration: Duration(milliseconds: 1500), curve: Curves.easeOutCubic);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  backgroundImage(context),
                  Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        FadeTransition(
                          opacity: _titleAnimation,
                          child: ContentCard(
                            titleText: 'Date / Time',
                            contentList: [
                              Text(
                                date_time_string,
                                style: MyFonts.contentText,
                              ),
                            ],
                          ),
                        ),
                        FadeTransition(
                          opacity: _titleAnimation,
                          child: ContentCard(
                            titleText: 'Venue',
                            contentList: [
                              Text(
                                venue_string,
                                style: MyFonts.contentText,
                              ),
                            ],
                          ),
                        ),
                        FadeTransition(
                          opacity: _titleAnimation,
                          child: ContentCard(
                            titleText: 'Program',
                            contentList: [
                              Text(
                                program_string,
                                style: MyFonts.contentText,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

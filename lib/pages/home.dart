import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';
import 'package:tsu_and_angel/widgets/background_image.dart';
import 'package:tsu_and_angel/widgets/content_card.dart';
import 'package:tsu_and_angel/widgets/navigation_bar.dart';
import 'package:tsu_and_angel/widgets/wedding_party.dart';

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
    String program_string = "14:00\nGuest arrival\nCeremony\n\n\n15:00\nDrinks and Canapés\nPhotos\nLawn games\n\n\n17:30\nWedding party photos\nReception\nSpeeches\nFirst Dance\n\n\n20:00\nDance floor opens\n\n\n~22:00\nHome time! (estimated curfew)\n";
    String gps_link = "https://g.page/Belairweddings";
    return Container(
      height: MediaQuery.of(context).size.height - 64,
      child: Scrollbar(
        controller: scrollController,
        isAlwaysShown: true,
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
                      (ratio > pcScreenRatio) ? 'assets/images/main.jpg' : 'assets/images/main.jpg',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned.fill(
                    bottom: 64.0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FadeTransition(
                        opacity: _titleAnimation,
                        child: ElevatedButton(
                          //RSVP button styling
                          style: ElevatedButton.styleFrom(
                            elevation: 8.0,
                            primary: Colors.white,
                            side: BorderSide(color: Colors.black54, width: 2.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                              left: 16.0,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'More',
                                  style: MyFonts.buttonText,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black54,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            scrollController.animateTo(MediaQuery.of(context).size.height - 64,
                                //animation settings
                                duration: Duration(milliseconds: 2000),
                                curve: Curves.easeOutQuart);
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ContentCard(
                          titleText: 'Date / Time',
                          contentList: [
                            Text(
                              date_time_string,
                              style: MyFonts.contentText,
                            ),
                          ],
                        ),
                        ContentCard(
                          titleText: 'Venue',
                          contentList: [
                            Text(
                              venue_string,
                              style: MyFonts.contentText,
                            ),
                          ],
                        ),
                        ContentCard(
                          titleText: 'Program',
                          contentList: [
                            Text(
                              program_string,
                              style: MyFonts.contentText,
                            ),
                          ],
                        ),
                        WeddingParty(
                          memberList: [
                            WeddingParty.member(
                              title: 'Groom',
                              name: 'Tsu-Shiuan',
                              imagePath: 'assets/images/tsu.png',
                            ),
                            WeddingParty.member(
                              title: 'Bride',
                              name: 'Angel',
                              imagePath: 'assets/images/angel.png',
                            ),
                            WeddingParty.member(
                              title: 'Best Man',
                              name: 'Eric',
                              imagePath: 'assets/images/eric.png',
                            ),
                            WeddingParty.member(
                              title: 'Maid of Honour',
                              name: 'Nadia',
                              imagePath: 'assets/images/nadia.png',
                            ),
                            WeddingParty.member(
                              title: 'Groomsman',
                              name: 'Paul',
                              imagePath: 'assets/images/paul.png',
                            ),
                            WeddingParty.member(
                              title: 'Groomsman',
                              name: 'Richard',
                              imagePath: 'assets/images/richard.png',
                            ),
                            WeddingParty.member(
                              title: 'Groomsman',
                              name: 'Tommy',
                              imagePath: 'assets/images/tommy.png',
                            ),
                            WeddingParty.member(
                              title: 'Bridesmaid',
                              name: 'Corli',
                              imagePath: 'assets/images/corli.png',
                            ),
                            WeddingParty.member(
                              title: 'Bridesmaid',
                              name: 'Davina',
                              imagePath: 'assets/images/davina.png',
                            ),
                            WeddingParty.member(
                              title: 'Bridesmaid',
                              name: 'Kusum',
                              imagePath: 'assets/images/kusum.png',
                            ),
                            WeddingParty.member(
                              title: 'Officiant',
                              name: 'Ariel',
                              imagePath: 'assets/images/ariel.png',
                            ),
                            WeddingParty.member(
                              title: 'Ring Bearer',
                              name: 'Avery',
                              imagePath: 'assets/images/avery.png',
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Stack(
                children: <Widget>[
                  backgroundImage(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

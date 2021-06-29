import 'package:flutter/material.dart';
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
    return Scrollbar(
      controller: scrollController,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: <Widget>[
            NavBar(
              selectedPosition: 0,
            ),
            splashScreen(),
          ],
        ),
      ),
    );
  }

  String date_time_string = "Thursday, 14 October 2021\nStart time : 14:00 for 14:30\nEnd time : till curfew :(";
  String venue_string = "Belair Pavillion\nSuid Agter Paarl Road\nPaarl, Cape Town\nWestern Cape\n9357\nGPS: https://g.page/Belairweddings";

  Widget splashScreen() {
    return Container(
      child: Stack(
        children: <Widget>[
          backgroundImage(context),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeTransition(
                    opacity: _titleAnimation,
                    child: ContentCard(
                      titleText: 'Photo!!', //@Tsu
                      contentList: [
                        Text('this is going to be a photo followed by a button'),
                      ],
                    ),
                  ),
                  FadeTransition(
                    opacity: _titleAnimation,
                    child: ContentCard(
                      titleText: 'Date / Time',
                      contentList: [
                        Text(date_time_string),
                      ],
                    ),
                  ),
                  FadeTransition(
                    opacity: _titleAnimation,
                    child: ContentCard(
                      titleText: 'Venue',
                      contentList: [
                        Text(venue_string),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

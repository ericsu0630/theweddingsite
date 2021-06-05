import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';
import 'package:tsu_and_angel/widgets/navigation_bar.dart';
import 'package:tsu_and_angel/widgets/rsvp_form.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late AnimationController _splashAnimationController,
      _titleAnimationController;
  late Animation<double> _splashAnimation, _titleAnimation;

  @override
  void initState() {
    super.initState();

    _splashAnimationController = AnimationController(
        duration: const Duration(milliseconds: 1000),
        value: 0,
        lowerBound: 0,
        upperBound: 1,
        vsync: this);

    _splashAnimation = CurvedAnimation(
        parent: _splashAnimationController, curve: Curves.easeInCubic);

    _splashAnimationController.forward();

    _titleAnimationController = AnimationController(
        duration: const Duration(milliseconds: 1000),
        value: 0,
        lowerBound: 0,
        upperBound: 1,
        vsync: this);

    _titleAnimation = CurvedAnimation(
        parent: _titleAnimationController, curve: Curves.easeInCubic);

    _splashAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _titleAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _splashAnimationController.dispose();
    _titleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: pageBody(),
      ),
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
            RsvpForm(),
          ],
        ),
      ),
    );
  }

  Widget splashScreen() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double ratio = width / height;
    double pcScreenRatio = 4 / 3;
    return Container(
      child: Stack(
        children: <Widget>[
          FadeTransition(
            opacity: _splashAnimation,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 64,
              child: Image.asset(
                (ratio > pcScreenRatio)
                    ? 'assets/images/picture_1.JPG'
                    : 'assets/images/picture_3.JPG',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 128.0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 32.0),
                  FadeTransition(
                    opacity: _titleAnimation,
                    child: Text(
                      'Thursday, 14th October 2021',
                      textAlign: TextAlign.center,
                      style: MyFonts.weddingDateText,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  FadeTransition(
                    opacity: _titleAnimation,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        elevation: 8.0,
                        side: BorderSide(width: 2.0, color: Colors.white),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 16.0, right: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'RSVP',
                              style: MyFonts.rsvpButtonText,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        scrollController.animateTo(
                            MediaQuery.of(context).size.height,
                            duration: Duration(milliseconds: 1500),
                            curve: Curves.easeOutCubic);
                      },
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

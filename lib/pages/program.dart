import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/colors.dart';
import 'package:tsu_and_angel/widgets/navigation_bar.dart';

class ProgramPage extends StatefulWidget {
  @override
  _ProgramPageState createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage>
    with TickerProviderStateMixin {
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
        parent: _splashAnimationController, curve: Curves.fastOutSlowIn);

    _splashAnimationController.forward();

    _titleAnimationController = AnimationController(
        duration: const Duration(milliseconds: 1000),
        value: 0,
        lowerBound: 0,
        upperBound: 1,
        vsync: this);

    _titleAnimation = CurvedAnimation(
        parent: _titleAnimationController, curve: Curves.fastOutSlowIn);

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
          FadeTransition(
            opacity: _splashAnimation,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              height: MediaQuery.of(context).size.height - 64,
              child: Opacity(
                opacity: MyOpacity.opacity,
                child: Image.asset(
                  'assets/images/belair_picture.jpeg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeTransition(
                    opacity: _titleAnimation,
                    child: Text(
                      'Coming Soon...',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'DancingScript',
                        fontSize: 72.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(5.0, 5.0),
                            blurRadius: 5.0,
                            color: Colors.black54,
                          ),
                        ],
                      ),
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key, required this.selectedPosition}) : super(key: key);
  final int selectedPosition;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selected = 0;
  ScrollController scrollController = ScrollController();
  List<String> titles = ['Welcome back!'];

  @override
  void initState() {
    selected = widget.selectedPosition;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToSelectedPosition());
  }

  void scrollToSelectedPosition() {
    //scroll to the end of the navbar if 4th or 5th item is selected
    if (selected >= 3) scrollController.animateTo(200, duration: const Duration(milliseconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 64,
      child: Center(
        child: ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return navBarItem(index);
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  void goToSelectedPage(Widget selectedPage) {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => selectedPage,
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
        transitionDuration: const Duration(milliseconds: 100),
      ),
      (route) => false,
    );
  }

  Widget navBarItem(int position) {
    return GestureDetector(
      // onTap: () {
      //   if (selected != position) {
      //     selected = position;
      //     switch (position) {
      //       case 0:
      //         goToSelectedPage(HomePage());
      //         break;
      //       case 1:
      //         goToSelectedPage(RsvpPage());
      //         break;
      //       case 2:
      //         goToSelectedPage(TipsPage());
      //         break;
      //       case 3:
      //         goToSelectedPage(TodoPage());
      //         break;
      //       case 4:
      //         goToSelectedPage(CovidPage());
      //         break;
      //     }
      //   }
      // },
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 4.0,
              color: (selected == position) ? Palette.primary : Colors.white,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: AutoSizeText(
            titles[position],
            maxLines: 1,
            style: TextStyle(
              fontSize: 23,
              color: Palette.primary,
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

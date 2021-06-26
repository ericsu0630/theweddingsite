import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/colors.dart';
import 'package:tsu_and_angel/pages/home.dart';
import 'package:tsu_and_angel/pages/covid.dart';
import 'package:tsu_and_angel/pages/rsvp.dart';
import 'package:tsu_and_angel/pages/accommodation.dart';
import 'package:tsu_and_angel/pages/program.dart';

class NavBar extends StatefulWidget {
  final int selectedPosition;

  const NavBar({Key? key, required this.selectedPosition}) : super(key: key);
  @override
  _NavBarState createState() => _NavBarState(selectedPosition);
}

class _NavBarState extends State<NavBar> {
  int selected = 0;
  _NavBarState(int selected) {
    this.selected = selected;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          navBarItem('Welcome!', 0),
          navBarItem('RSVP', 1),
          navBarItem('Tips', 2),
          // navBarItem('Program', 3),
          navBarItem('Covid Safety', 4),
        ],
      ),
    );
  }

  Widget navBarItem(String title, int position) {
    return GestureDetector(
      onTap: () {
        print('$title tapped');
        setState(() {
          selected = position;
        });
        switch (position) {
          case 0:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => VenuePage(),
                transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                transitionDuration: Duration(milliseconds: 500),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => HomePage(),
                transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                transitionDuration: Duration(milliseconds: 500),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => AccommodationPage(),
                transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                transitionDuration: Duration(milliseconds: 500),
              ),
            );
            break;
          // case 3:
          //   Navigator.push(
          //     context,
          //     PageRouteBuilder(
          //       pageBuilder: (_, __, ___) => ProgramPage(),
          //       transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          //       transitionDuration: Duration(milliseconds: 500),
          //     ),
          //   );
          //   break;
          case 4:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => CovidPage(),
                transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
                transitionDuration: Duration(milliseconds: 500),
              ),
            );
            break;
        }
      },
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
        child: AutoSizeText(
          title,
          maxLines: 1,
          style: TextStyle(
            fontSize: 18,
            color: Palette.primary,
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

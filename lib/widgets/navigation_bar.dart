import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/colors.dart';

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
          navBarItem('Our Wedding', 0),
          navBarItem('Venue', 1),
          navBarItem('Accommodation', 2),
          navBarItem('Program', 3),
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
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            break;
          case 1:
            Navigator.pushNamed(context, '/venue');
            break;
          case 2:
            Navigator.pushNamed(context, '/accommodation');
            break;
          case 3:
            Navigator.pushNamed(context, '/program');
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
            fontFamily: 'Courgette',
            fontWeight: (selected == position) ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }
}

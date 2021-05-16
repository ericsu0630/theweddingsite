import 'package:flutter/material.dart';
import 'package:tsu_and_angel/pages/home.dart';
import 'package:tsu_and_angel/pages/venue.dart';
import 'package:tsu_and_angel/styles/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Palette.primary),
      debugShowCheckedModeBanner: false,
      title: 'TsuAndAngel',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/venue': (context) => VenuePage(),
        // '/accommodation': (context) => AccommodationPage(),
        // '/programme': (context) => ProgramPage(),
      },
    );
  }
}

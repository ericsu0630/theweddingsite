import 'package:flutter/material.dart';
import 'package:tsu_and_angel/pages/accommodation.dart';
import 'package:tsu_and_angel/pages/covid.dart';
import 'package:tsu_and_angel/pages/home.dart';
import 'package:tsu_and_angel/pages/program.dart';
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
        '/': (context) => VenuePage(),
        '/venue': (context) => HomePage(),
        '/accommodation': (context) => AccommodationPage(),
        '/program': (context) => ProgramPage(),
        '/covid': (context) => CovidPage(),
      },
    );
  }
}

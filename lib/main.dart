import 'package:flutter/material.dart';
import 'package:tsu_and_angel/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TsuAndAngel',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        // '/rsvp': (context) => RsvpPage(),
        // '/venue': (context) => VenuePage(),
        // '/accommodation': (context) => AccommodationPage(),
        // '/programme': (context) => ProgrammePage(),
      },
    );
  }
}

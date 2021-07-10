import 'package:flutter/material.dart';
import 'package:tsu_and_angel/pages/home.dart';
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
      onGenerateTitle: (BuildContext context) {
        return 'Tsu-Shiuan & Angel';
      },
      home: HomePage(),
    );
  }
}

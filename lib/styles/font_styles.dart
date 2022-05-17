import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsu_and_angel/styles/colors.dart';

class MyFonts {
  static TextStyle contentTitleText = const TextStyle(
    fontSize: 28.0,
    fontFamily: 'DancingScript',
    fontWeight: FontWeight.w900,
    color: Colors.black87,
  );
  //https://pub.dev/packages/google_fonts
  //https://fonts.google.com/
  static TextStyle contentText = GoogleFonts.cookie(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Colors.black54,
  );
  static TextStyle contentTextSubtitle = const TextStyle(
    fontSize: 22.0,
    fontFamily: 'DancingScript',
    fontWeight: FontWeight.w600,
    color: Colors.black54,
  );
  static TextStyle contentTextDarker = const TextStyle(
    fontSize: 18.0,
    fontFamily: 'DancingScript',
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );
  static TextStyle contentTextBold = TextStyle(
    fontSize: 18.0,
    fontFamily: 'DancingScript',
    fontWeight: FontWeight.w600,
    color: Palette.primary,
  );
  static TextStyle buttonText = const TextStyle(
    fontSize: 40.0,
    fontFamily: 'DancingScript',
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );
}

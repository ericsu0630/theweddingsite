import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/colors.dart';

class MyFonts {
  static TextStyle formQuestionText = TextStyle(
    fontFamily: 'DancingScript',
    color: Palette.primary,
    fontSize: 20.0,
  );

  static TextStyle sorryText = const TextStyle(
    fontFamily: 'DancingScript',
    color: Colors.black87,
    fontSize: 16.0,
  );

  static TextStyle formInputText = const TextStyle(
    fontFamily: 'DancingScript',
    color: Colors.black54,
    fontSize: 16.0,
  );

  static TextStyle replyButtonText = const TextStyle(
    fontFamily: 'DancingScript',
    color: Colors.white,
    fontSize: 16.0,
  );

  static TextStyle rsvpButtonText = const TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    letterSpacing: 2.0,
    fontFamily: 'DancingScript',
    shadows: <Shadow>[
      Shadow(
        offset: Offset(5.0, 5.0),
        blurRadius: 5.0,
        color: Colors.black54,
      ),
    ],
  );

  static TextStyle weddingDateText = const TextStyle(
    fontFamily: 'DancingScript',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(5.0, 5.0),
        blurRadius: 5.0,
        color: Colors.black54,
      ),
    ],
  );

  static TextStyle comingSoonText = const TextStyle(
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
  );
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/opacity.dart';

Widget backgroundImage(BuildContext context) {
  final double containerSize = min(MediaQuery.of(context).size.height * 2, 1150);
  return Container(
    width: MediaQuery.of(context).size.width,
    color: Colors.white,
    height: containerSize,
    child: Column(
      children: [
        Expanded(
          child: Opacity(
            opacity: MyOpacity.opacity, //tsu opacity value from 0 to 1
            child: Image.asset(
              'assets/images/belair_picture.jpeg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(
          child: Opacity(
            opacity: MyOpacity.opacity, //tsu opacity value from 0 to 1
            child: Image.asset(
              'assets/images/belair_picture_1.jpeg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget backgroundImage1(BuildContext context) {
  final double containerSize = MediaQuery.of(context).size.height - 64;
  return Container(
    width: MediaQuery.of(context).size.width,
    color: Colors.white,
    height: containerSize,
    child: Column(
      children: [
        Expanded(
          child: Opacity(
            opacity: MyOpacity.opacity, //tsu opacity value from 0 to 1
            child: Image.asset(
              'assets/images/belair_picture.jpeg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ],
    ),
  );
}

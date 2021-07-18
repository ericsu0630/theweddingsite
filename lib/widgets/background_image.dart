import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/opacity.dart';
import 'dart:math';

Widget backgroundImage(BuildContext context) {
  double container_size = min(MediaQuery.of(context).size.height * 2, 1200);
  return Container(
    width: MediaQuery.of(context).size.width,
    color: Colors.white,
    height: container_size,
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
  double container_size = MediaQuery.of(context).size.height - 64;
  return Container(
    width: MediaQuery.of(context).size.width,
    color: Colors.white,
    height: container_size,
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

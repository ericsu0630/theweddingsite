import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/opacity.dart';

Widget backgroundImage(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    color: Colors.white,
    height: MediaQuery.of(context).size.height - 64,
    child: Opacity(
      opacity: MyOpacity.opacity, //tsu opacity value from 0 to 1
      child: Image.asset(
        'assets/images/belair_picture.jpeg',
        fit: BoxFit.fitHeight,
      ),
    ),
  );
}

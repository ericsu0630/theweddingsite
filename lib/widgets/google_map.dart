// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class MyGoogleMap extends StatefulWidget {
  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  @override
  void initState() {
    super.initState();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'my_google_map',
        (int viewId) => IFrameElement()
          ..src =
              'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3316.4546960779608!2d18.921837115658843!3d-33.77475448068248!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x1dcda97505abaf5f%3A0xce783c25c031341d!2sBelair%20Pavilion!5e0!3m2!1sen!2stw!4v1625936963512!5m2!1sen!2stw' //@Tsu URL for google form goes here
          ..style.border = 'none');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      child: const HtmlElementView(
        viewType: 'my_google_map',
      ),
    );
  }
}

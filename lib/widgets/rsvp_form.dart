// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RsvpForm extends StatefulWidget {
  @override
  _RsvpFormState createState() => _RsvpFormState();
}

class _RsvpFormState extends State<RsvpForm> {
  @override
  void initState() {
    super.initState();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'my_google_form',
        (int viewId) => IFrameElement()
          ..src =
              'https://docs.google.com/forms/d/e/1FAIpQLScRSiBezvevmvAWelQLAROmCD73PUY28NFeuD_CKKfkbkMVHQ/viewform?usp=sf_link' //@Tsu URL for google form goes here
          ..style.border = 'none');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - 64,
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.white,
        child: HtmlElementView(viewType: 'my_google_form'));
  }
}

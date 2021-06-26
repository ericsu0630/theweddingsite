// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:webviewx/webviewx.dart';

class RsvpForm extends StatefulWidget {
  @override
  _RsvpFormState createState() => _RsvpFormState();
}

class _RsvpFormState extends State<RsvpForm> {
  late WebViewXController webviewController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 64,
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.white,
      child: WebViewX(
        initialContent: 'https://docs.google.com/forms/d/e/1FAIpQLScRSiBezvevmvAWelQLAROmCD73PUY28NFeuD_CKKfkbkMVHQ/viewform?usp=sf_link', // @Tsu form URL goes here
        initialSourceType: SourceType.URL,
        onWebViewCreated: (controller) => webviewController = controller,
      ),
    );
  }
}

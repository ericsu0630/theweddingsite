// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';
import 'package:tsu_and_angel/widgets/navigation_bar.dart';

class RsvpPage extends StatefulWidget {
  @override
  _RsvpPageState createState() => _RsvpPageState();
}

class _RsvpPageState extends State<RsvpPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'my_google_form',
      (int viewId) => IFrameElement()
        ..src =
            'https://docs.google.com/forms/d/e/1FAIpQLScRSiBezvevmvAWelQLAROmCD73PUY28NFeuD_CKKfkbkMVHQ/viewform?usp=sf_link' //@Tsu URL for google form goes here
        ..style.border = 'none',
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: pageBody(),
      ),
    );
  }

  Widget pageBody() {
    double h = MediaQuery.of(context).size.height - 64;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      h = 700;
    }
    return Column(
      children: <Widget>[
        const NavBar(selectedPosition: 1),
        Stack(
          children: <Widget>[
            Positioned.fill(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5), //opacity of the card
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const CircularProgressIndicator(
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Please wait...',
                          style: MyFonts.contentText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 275),
              height: h,
              width: MediaQuery.of(context).size.width,
              child: const HtmlElementView(viewType: 'my_google_form'),
            ),
          ],
        ),
      ],
    );
  }
}

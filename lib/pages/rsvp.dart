import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';
import 'package:tsu_and_angel/widgets/background_image.dart';
import 'package:tsu_and_angel/widgets/navigation_bar.dart';
import 'package:tsu_and_angel/widgets/rsvp_form.dart';

class RsvpPage extends StatefulWidget {
  @override
  _RsvpPageState createState() => _RsvpPageState();
}

class _RsvpPageState extends State<RsvpPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: pageBody(),
      ),
    );
  }

  Widget pageBody() {
    return Column(
      children: <Widget>[
        NavBar(
          selectedPosition: 1,
        ),
        Stack(
          children: <Widget>[
            Positioned.fill(
                child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5), //opacity of the card
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(
                        strokeWidth: 4.0,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Please wait...',
                        style: MyFonts.contentText,
                      ),
                    ],
                  ),
                ),
              ),
            )),
            RsvpForm(),
          ],
        ),
      ],
    );
  }
}

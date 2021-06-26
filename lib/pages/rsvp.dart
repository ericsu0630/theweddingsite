import 'package:flutter/material.dart';
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
            backgroundImage(context),
            RsvpForm(),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tsu_and_angel/widgets/navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageBody(),
    );
  }

  Widget pageBody() {
    return Scrollbar(
      controller: scrollController,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          child: Column(
            children: <Widget>[
              NavBar(),
              pageContent(),
              rsvpForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageContent() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            height: MediaQuery.of(context).size.height - 100,
          )
        ],
      ),
    );
  }

  Widget rsvpForm() {
    return Container();
  }
}

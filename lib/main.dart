import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tsu_and_angel/firebase_options.dart';
import 'package:tsu_and_angel/pages/home.dart';
import 'package:tsu_and_angel/styles/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      theme: ThemeData(primaryColor: Palette.primary),
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) {
        return 'Tsu-Shiuan & Angel';
      },
      home: HomePage(),
    );
  }
}

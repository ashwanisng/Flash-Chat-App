import 'dart:ui';

import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flash Chat',
      theme: ThemeData.dark().copyWith(
          primaryColor: kBlueColor,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.black),
          )),
      home: WelcomeScreen(),
    );
  }
}

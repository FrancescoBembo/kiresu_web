// ignore: unused_import
import 'dart:html';
//import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:kiresu_web/Screens/login_screen.dart';

void main() {
  runApp(KiresuManagerApp());
}

Color myHexColor = Color(0xffD24848);

class KiresuManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiresu Manager',
      routes: {
        '/': (context) => LoginScreen(),
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}

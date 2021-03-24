// ignore: unused_import
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kiresu_web/Screens/login_screen.dart';

void main() {
  runApp(KiresuManagerApp());
}

class KiresuManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiresu Manager',
      //home: LoginScreen(),
      routes: {
        '/': (context) => SignUpScreen(),
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}

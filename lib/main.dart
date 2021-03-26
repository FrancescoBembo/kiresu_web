// ignore: unused_import
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:kiresu_web/Screens/add_user_screen.dart';
import 'package:kiresu_web/Screens/login_screen.dart';

import 'Screens/home_screen.dart';

void main() {
  runApp(KiresuManagerApp());
}

class KiresuManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiresu Manager',
      theme: ThemeData(
        primaryColor: Colors.indigo[800],
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: Colors.indigo[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            side: BorderSide(width: 2, color: Colors.indigo.shade800),
          ),
        ),
      ),
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/addUser': (context) => AddUserScreen(),
      },
    );
  }
}

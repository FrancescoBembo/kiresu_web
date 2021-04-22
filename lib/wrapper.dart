import 'package:flutter/material.dart';
import 'package:kiresu_web/Screens/home_screen.dart';
import 'package:kiresu_web/Screens/login_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or login screen

    return LoginScreen();
  }
}

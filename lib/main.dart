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
      title: 'Kiresu Manager',
      home: LoginScreen(),
    );
  }
}

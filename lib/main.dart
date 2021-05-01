// ignore: unused_import
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:kiresu_web/Screens/add_user_screen.dart';
import 'package:kiresu_web/Screens/login_screen.dart';
import 'package:kiresu_web/Screens/users_screen.dart';
import 'package:kiresu_web/services/user.dart';
import 'package:kiresu_web/wrapper.dart';
import 'package:provider/provider.dart';

import 'Screens/home_screen.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

// ignore: import_of_legacy_library_into_null_safe
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(KiresuManagerApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(KiresuManagerApp());
}

class KiresuManagerApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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
      home: Wrapper(),
      routes: {
        '/login': (_) => LoginScreen(),
        '/home': (_) => HomeScreen(),
        '/addUser': (_) => AddUserScreen(),
        '/users': (_) => UsersScreen(),
      },
    );
  }
}
// return FutureBuilder(
//       // Initialize FlutterFire:
//       future: _initialization,
//       builder: (context, snapshot) {
//         // Check for errors
//         if (snapshot.hasError) {
//           //return somethingWentWrong();
//                   }

//                   // Once complete, show your application
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     return MaterialApp(
//                       debugShowCheckedModeBanner: false,
//                       title: 'Kiresu Manager',
//                       theme: ThemeData(
//                       primaryColor: Colors.indigo[800],
//                       outlinedButtonTheme: OutlinedButtonThemeData(
//                         style: OutlinedButton.styleFrom(
//                           primary: Colors.indigo[800],
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                         side: BorderSide(width: 2, color: Colors.indigo.shade800),
//                         ),
//                       ),
//                       ),
//                       home: Wrapper(),
//                       routes: {
//                         '/login': (context) => LoginScreen(),
//                         '/home': (context) => HomeScreen(),
//                         '/addUser': (context) => AddUserScreen(),
//                       },
//                     );
//                   }

//                 },
//

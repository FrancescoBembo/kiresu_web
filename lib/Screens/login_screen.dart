import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_screen.dart';
import 'home_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset('assets/logo1.png'),
          ),
          Center(
            child: SizedBox(
              width: 400,
              child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SignUpForm()),
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [
      _usernameTextController,
      _passwordTextController,
    ];

    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showHomeScreen(User user) {
    Navigator.of(context).pushNamed('/home', arguments: HomeArguments(user));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              validator: (String? value) {
                if (value!.isEmpty) return 'Please enter some text';
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: TextFormField(
              obscureText: true,
              controller: _passwordTextController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              validator: (String? value) {
                if (value!.isEmpty) return 'Please enter some text';
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            child: SizedBox(
              width: 104.0,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () async {
                  // _formProgress == 1 ? _showHomeScreen : null
                  if (_formKey.currentState!.validate()) {
                    await _signInWithEmailAndPassword();
                  }
                },
                child: Text('LOGIN'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: _usernameTextController.text,
        password: _passwordTextController.text,
      ))
          .user;
      _showHomeScreen(user!);
    } catch (e) {
      print('Incorrect Credentials.');
    }
  }
}

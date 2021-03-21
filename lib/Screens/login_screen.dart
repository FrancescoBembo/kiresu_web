import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _txtFieldNotEmpty = false;
  @override
  Widget build(BuildContext context) {
    var _onPressed;

    if (_txtFieldNotEmpty) {
      _onPressed = () {
        print("Logged in");
      };
    } else {}

    return Scaffold(
      appBar: AppBar(
        title: Text('Kiresu'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 0.2 * MediaQuery.of(context).size.width,
            child: TextField(
              onChanged: (userTxt) {
                print("Username text field: $userTxt");
                if (userTxt != null) {
                  _txtFieldNotEmpty = true;
                  print(_txtFieldNotEmpty);
                } else {
                  _txtFieldNotEmpty = false;
                  print(_txtFieldNotEmpty);
                }
              },
              decoration: InputDecoration(
                  labelText: 'Username', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 0.2 * MediaQuery.of(context).size.width,
            child: TextField(
              onChanged: (pswTxt) {
                print("Password text field: $pswTxt");
              },
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _onPressed,
                child: Text('LOGIN'),
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

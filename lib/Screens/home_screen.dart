import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.apps),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text('Kiresu'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                ),
                color: Colors.indigo.shade800,
              ),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(56, 32, 56, 0),
              child: SizedBox(
                height: 44,
                child: OutlinedButton.icon(
                  label: Text('LOGOUT'),
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                    print('Pressed');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      //////////////////////
    );
  }
}

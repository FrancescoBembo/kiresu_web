import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeArguments {
  final User user;

  HomeArguments(this.user);
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeArguments args =
        ModalRoute.of(context)!.settings.arguments as HomeArguments;
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
      //////////////// Drawer ///////////////
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo_with_pad.png'),
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
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushNamed('/');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      ////////////////////// BODY /////
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: SizedBox(
                  height: 44,
                  width: 140,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/addUser');
                    },
                    icon: Icon(Icons.add),
                    label: Text('ADD USERS'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Card(
                    elevation: 5,
                    child: InkWell(
                      splashColor: Colors.indigo.shade600.withAlpha(40),
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                            child: Image.asset('assets/ic_buildings.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                            child: Text(
                              'Buildings',
                              style: TextStyle(
                                  color: Colors.indigo.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Card(
                    elevation: 5,
                    child: InkWell(
                      splashColor: Colors.indigo.shade600.withAlpha(40),
                      onTap: () {
                        Navigator.of(context).pushNamed('/users');
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 24, 16, 8),
                            child: Image.asset('assets/ic_userlist.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                            child: Text(
                              'Users',
                              style: TextStyle(
                                  color: Colors.indigo.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

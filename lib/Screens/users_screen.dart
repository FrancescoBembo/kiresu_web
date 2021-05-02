import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiresu_web/models/user.dart' as u;
import 'package:kiresu_web/services/user.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<u.User>>(
        initialData: [],
        stream: UserService(uid: '').users,
        builder: (BuildContext context, AsyncSnapshot<List<u.User>> snapshot) {
          if (snapshot.data?.isEmpty == false) {
            print(snapshot.data);
            var users = snapshot.data ?? [];
            return Scaffold(
              appBar: AppBar(
                title: Text('Users'),
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 32.0, right: 32.0, top: 5, bottom: 5),
                        child: Container(
                          child: SizedBox(
                            height: 100,
                            child: Card(
                              elevation: 5,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20.0),
                                        child: CircleAvatar(
                                            radius: 35.0,
                                            backgroundColor: Colors.grey[300],
                                            child: Image.network(
                                                users[index].photo_url)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          users[index].fName +
                                              ' ' +
                                              users[index].lName,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  )),
                                  Expanded(
                                      flex: 0,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20.0),
                                        child: RawMaterialButton(
                                          fillColor: Colors.indigo[800],

                                          onPressed: () {
                                            UserService(uid: users[index].uid)
                                                .deleteUser();
                                            users.removeAt(index);
                                          }, //Delete
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0, right: 15.0),
                                            child: Text(
                                              'Delete User',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Users'),
              ),
              body: Center(
                child: Container(
                  child: Text(
                      'No users found, add a new user through the home page.'),
                ),
              ),
            );
          }
        });
  }
}

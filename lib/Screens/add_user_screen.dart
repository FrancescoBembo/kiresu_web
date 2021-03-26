import 'package:flutter/material.dart';

class AddUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User manager'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 32, 16, 32),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Card(
                    elevation: 2,
                    child: InkWell(
                      splashColor: Colors.indigo.shade600.withAlpha(40),
                      onTap: () {
                        print('Upload photo');
                      },
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
                              child: Icon(Icons
                                  .camera_alt_outlined) //Image.asset('assets/ic_buildings.png'),
                              ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text(
                              'Add Photo',
                              style: TextStyle(
                                  //color: Colors.indigo.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 32, 32),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Card(
                    elevation: 2,
                    child: InkWell(
                      splashColor: Colors.indigo.shade600.withAlpha(40),
                      onTap: () {
                        print('Upload ID photo');
                      },
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
                              child: Icon(Icons
                                  .assignment_ind_outlined) //Image.asset('assets/ic_buildings.png'),
                              ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: Text(
                              'Add ID Photo',
                              style: TextStyle(
                                  //color: Colors.indigo.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          /////////////////////////////////////////////////////////////
          Row(
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'First name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Last name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

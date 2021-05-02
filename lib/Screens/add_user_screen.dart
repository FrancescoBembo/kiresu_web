import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:kiresu_web/models/user.dart';
import 'package:kiresu_web/services/user.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

//InputElement uploadInput;

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  DateTime selectedDate = DateTime.now();
  User user = new User(
      uid: '',
      fName: '',
      lName: '',
      gesture: '👆',
      dOB: DateTime.now().toLocal().toString(),
      keepData: false,
      photoID_url: '',
      photo_url: '',
      validityFrom: DateTime.now().toLocal().toString(),
      validityTo: DateTime.now().add(Duration(days: 10)).toLocal().toString());

  onSwitchSaveDetails(bool doSave) {
    setState(() {
      user.keepData = doSave;
    });
  }

  Future<Uint8List?> uploadImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowedExtensions: ['png']);

    if (result?.files.first != null) {
      var fileBytes = result?.files.first.bytes;
      return fileBytes;
    }
  }

  Future<String> uploadFile(Uint8List fileBytes) async {
    var response = '';
    var metadata = firebase_storage.SettableMetadata(contentType: "image/png");
    var upload = await firebase_storage.FirebaseStorage.instance
        .ref('${user.fName + user.lName}.png')
        .putData(fileBytes, metadata);

    response = await upload.ref.getDownloadURL();

    return response;
  }

  generateEmoji() {
    setState(() {
      if (emoji == "👆") {
        emoji = "✊";
      } else if (emoji == "✊") {
        emoji = "👌";
      } else if (emoji == "✌️") {
        emoji = "👆";
      } else {
        emoji = "✌️";
      }
    });

    print(emoji);
  }

  String emojiToGesture(String emoji) {
    String gestureName = "";

    if (emoji == "👆") {
      gestureName = "loser";
    } else if (emoji == "✊") {
      gestureName = "fist";
    } else if (emoji == "👌") {
      gestureName = "okay";
    } else if (emoji == "✌️") {
      gestureName = "peace";
    }
    print(gestureName);
    return gestureName;
  }

  Future<String> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2022),
      initialDatePickerMode: DatePickerMode.year,
      fieldLabelText: 'Date of Birth',
      fieldHintText: 'MM/DD/YYYY',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    return selectedDate.toString();
  }

  _validityDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDatePickerMode: DatePickerMode.year,
      fieldLabelText: 'Access validity',
      fieldHintText: 'MM/DD/YYYY',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    return selectedDate.toString();
  }

  String emoji = "👆";
  String date1 = DateTime.now().toLocal().toString();
  String date2 = DateTime.now().add(Duration(days: 10)).toLocal().toString();
  String dob = DateTime.now().toLocal().toString();
  Uint8List? photo;
  Uint8List? photoID;
  String saveText = 'Add user';

  @override
  Widget build(BuildContext context) {
    //var emoji;
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
                      onTap: () async {
                        photo = await uploadImage();
                      },
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
                              child: Icon(Icons
                                  .camera_alt_outlined) //Image.asset('assets/ic_buildings.png'),
                              ),
                          Center(
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
                      onTap: () async {
                        photoID = await uploadImage();
                      },
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
                              child: Icon(Icons
                                  .assignment_ind_outlined) //Image.asset('assets/ic_buildings.png'),
                              ),
                          Center(
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(34, 8, 0, 8),
                child: Text(
                  'User Details',
                  style: TextStyle(
                      //color: Colors.indigo.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
          ////////////////    USER DETAILS INPUT FILEDS    ///////////////////////////
          Row(
            children: [
              SizedBox(
                width: 32,
                height: 40,
              ),
              Flexible(
                flex: 1,
                child: TextField(
                  onChanged: (val) {
                    setState(() => user.fName = val);
                  },
                  decoration: InputDecoration(
                      labelText: 'First name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              SizedBox(
                width: 32,
                height: 40,
              ),
              Flexible(
                flex: 1,
                child: TextField(
                  onChanged: (val) {
                    setState(() => user.lName = val);
                  },
                  decoration: InputDecoration(
                      labelText: 'Last name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              SizedBox(
                width: 32,
                height: 40,
              ),
              SizedBox(
                height: 48,
                child: OutlinedButton.icon(
                  label: Text("Date of birth: " + "$dob".split(' ')[0]),
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    String date = await _selectDate(context);
                    selectedDate = DateTime.now();
                    user.dOB = date;
                    setState(() {
                      dob = date;
                    });
                  },
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(34, 40, 0, 8),
                child: Text(
                  'Access Validity',
                  style: TextStyle(
                      //color: Colors.indigo.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
          ////////////////   ACCESS VALIDITY INPUT FILEDS    ///////////////////////////
          Row(
            children: [
              SizedBox(
                width: 32,
                height: 40,
              ),
              SizedBox(
                height: 48,
                child: OutlinedButton.icon(
                  label: Text("From: " + "$date1".split(' ')[0]),
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    String date = await _validityDate(context);
                    selectedDate = DateTime.now();
                    user.validityFrom = date;
                    setState(() {
                      date1 = date;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 32,
                height: 40,
              ),
              SizedBox(
                height: 48,
                child: OutlinedButton.icon(
                  label: Text("To: " + "$date2".split(' ')[0]),
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    String date = await _validityDate(context);
                    selectedDate = DateTime.now();
                    user.validityTo = date;
                    setState(() {
                      date2 = date;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 32,
                height: 40,
              ),
              Switch(
                  value: user.keepData,
                  activeTrackColor: Colors.indigo[300],
                  activeColor: Colors.indigo[800],
                  onChanged: (doSave) {
                    onSwitchSaveDetails(doSave);
                    print("save details: ");
                    print(user.keepData);
                  }),
              SizedBox(
                width: 160,
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Keep data after expiry",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          /////////////////////     Generate Gesture (EMOJI)     ////////////////////////
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(34, 40, 0, 8),
                child: Text(
                  'Generate gersture',
                  style: TextStyle(
                      //color: Colors.indigo.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(32, 8, 16, 32),
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Card(
                          elevation: 2,
                          child: InkWell(
                            splashColor: Colors.indigo.shade600.withAlpha(40),
                            onTap: () {
                              print('New Gesture');
                              generateEmoji();
                              user.gesture = emoji;
                              //emojiToGesture(emoji);
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                  child: Text(
                                    emoji,
                                    style: TextStyle(
                                        //color: Colors.indigo.shade800,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ))))
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 16, 32),
                child: RawMaterialButton(
                  fillColor: Colors.indigo[800],
                  textStyle: TextStyle(color: Colors.white),
                  onPressed: () async {
                    setState(() {
                      saveText = 'Loading';
                    });
                    setState(() {
                      saveText = 'Uploading Pictures';
                    });
                    user.photo_url = await uploadFile(photo!);
                    user.photoID_url = await uploadFile(photoID!);
                    if (user.photo_url == '') {
                      setState(() {
                        saveText = 'Failed - Upload Picture';
                      });
                    } else {
                      print('UID: ' + user.uid);
                      print('fname: ' + user.fName);
                      print('lname: ' + user.lName);
                      print('gesture: ' + user.gesture);
                      print('photoid: ' + user.photoID_url);
                      print('photo: ' + user.photo_url);
                      print('from: ' + user.validityFrom);
                      print('to: ' + user.validityTo);
                      print('keep: ' + user.keepData.toString());
                      print('dob: ' + user.dOB);
                      setState(() {
                        saveText = 'Saving data';
                      });
                      await UserService(uid: '').newUser(user);

                      setState(() {
                        saveText = 'User Added';
                      });

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(saveText),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// void uploadToStorage(CurrentUser user) {
//   final dateTime = DateTime.now();
//   final userId = user.id;
//   final path = '$userId/$dateTime';
// }

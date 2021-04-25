import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:html';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

//InputElement uploadInput;

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  DateTime selectedDate = DateTime.now();

  bool save = false;
  onSwitchSaveDetails(bool doSave) {
    setState(() {
      save = doSave;
    });
  }

  _selectDate(BuildContext context) async {
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
  }

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
                      onTap: () {
                        uploadImage();
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
                        uploadImage();
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
                  label: Text("Date of birth: " +
                      "${selectedDate.toLocal()}".split(' ')[0]),
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
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
                  label: Text(
                      "From: " + "${selectedDate.toLocal()}".split(' ')[0]),
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _validityDate(context),
                ),
              ),
              SizedBox(
                width: 32,
                height: 40,
              ),
              SizedBox(
                height: 48,
                child: OutlinedButton.icon(
                  label:
                      Text("To: " + "${selectedDate.toLocal()}".split(' ')[0]),
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _validityDate(context),
                ),
              ),
              SizedBox(
                width: 32,
                height: 40,
              ),
              Switch(
                  value: save,
                  activeTrackColor: Colors.indigo[300],
                  activeColor: Colors.indigo[800],
                  onChanged: (doSave) {
                    onSwitchSaveDetails(doSave);
                    print("save details: ");
                    print(save);
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
                              String emoji = generateEmoji();
                              //emojiToGesture(emoji);
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                  child: Text(
                                    'new emoji',
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
          )
        ],
      ),
    );
  }
}

void uploadImage() {
  FileUploadInputElement uploadInput = new FileUploadInputElement()
    ..accept = 'image/*';
  uploadInput.click();

  uploadInput.onChange.listen((event) {
    final file = uploadInput.files!.first;
    final reader = FileReader();
    reader.readAsDataUrl(file);
    reader.onLoadEnd.listen((event) {
      print("done");
    });
  });
}

String generateEmoji() {
  Random random = new Random();
  int randomNumber = random.nextInt(3);
  //print(randomNumber);

  String emoji = "";

  if (randomNumber == 0) {
    emoji = "👆";
  } else if (randomNumber == 1) {
    emoji = "✊";
  } else if (randomNumber == 2) {
    emoji = "👌";
  } else if (randomNumber == 3) {
    emoji = "✌️";
  }
  print(emoji);
  return emoji;
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

// void uploadToStorage(CurrentUser user) {
//   final dateTime = DateTime.now();
//   final userId = user.id;
//   final path = '$userId/$dateTime';
// }

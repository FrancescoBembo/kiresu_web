import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  DateTime selectedDate = DateTime.now();

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
          ////////////////////////////////////////////////////////////
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
                  label: Text("${selectedDate.toLocal()}".split(' ')[0]),
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
        ],
      ),
    );
  }
}

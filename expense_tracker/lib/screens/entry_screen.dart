import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_ticker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_keyboard.dart';
import '../constants/constants.dart';
import 'package:intl/intl.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  String dropdownValue = 'Income';
  final TextEditingController _myController = TextEditingController();
  TextEditingController timeInput = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  String title = '';
  String description = '';
  int amount = 0;
  String date = '';
  String time = '';

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      DateTime parsedTime = DateFormat.jm().parse(
        pickedTime.format(context).toString(),
      );
      //converting to DateTime so that we can further format on different pattern.

      String formattedTime = DateFormat('h:mm a').format(parsedTime);
      time = formattedTime;

      setState(() {
        timeInput.text = formattedTime; //set the value of text field.
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd MMMM, yyyy').format(pickedDate);
      date = formattedDate;

      setState(() {
        dateInput.text = formattedDate; //set output date to TextField value.
      });
    }
  }

  static String accounts = "Accounts";

  CollectionReference category =
      FirebaseFirestore.instance.collection(accounts);

  Future<dynamic> add() {
    return category.add({
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'type': dropdownValue,
      'amount': double.parse(_myController.text),
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.check,
            size: 40.0,
          ),
          onPressed: () async {
            if (title != '' &&
                description != '' &&
                date != '' &&
                time != '' &&
                dropdownValue != '' &&
                _myController.text != '') {
              final ad = await add();
              if (ad != null) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              }
            }

            else {
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    title: const Text(
                      'Alert!',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: const Text(
                      'Please fill all the fields',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
        backgroundColor: Colors.white.withOpacity(0.8),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(

                    height: 40,
                    decoration: kTextFieldContainerDecoration,
                    child: TextField(
                      onChanged: (value) {
                        title = value;
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                      ],
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Title',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 130.0,
                    decoration: kTextFieldContainerDecoration,
                    child: TextField(
                      onChanged: (value) {
                        description = value;
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(100),
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-zA -Z0-9]')),
                      ],
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Description',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  // Date(),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        decoration: kTextFieldContainerDecoration,
                        child: IconButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          icon: const Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: kTextFieldContainerDecoration,
                          child: TextField(
                            controller: dateInput,
                            enabled: false,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Date',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        decoration: kTextFieldContainerDecoration,
                        child: IconButton(
                          onPressed: () {
                            _selectTime(context);
                          },
                          icon: const Icon(
                            Icons.access_time_outlined,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: kTextFieldContainerDecoration,
                          child: TextField(
                            controller: timeInput,
                            enabled: false,
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Time',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 40,
                    decoration: kTextFieldContainerDecoration,
                    child: DropdownButtonFormField<String>(
                      decoration: kTextFieldDecoration,
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        dropdownValue = newValue!;
                      },
                      items: <String>['Income', 'Expense']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black45),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 40,
                    decoration: kTextFieldContainerDecoration,
                    child: TextField(

                      keyboardType: TextInputType.none,
                      controller: _myController,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Amount',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  NumPad(
                    buttonSize: 40,
                    buttonColor: Colors.white,
                    controller: _myController,

                    delete: () {
                      _myController.text = _myController.text
                          .substring(0, _myController.text.length - 1);
                    },

                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

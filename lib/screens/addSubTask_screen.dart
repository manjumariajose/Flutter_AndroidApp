import 'package:achieveit/screens/createGoal_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:achieveit/constants.dart';
import 'package:achieveit/models/subtask.dart';

final _fireStore = Firestore.instance;
FirebaseUser loggedInUser;

// ignore: must_be_immutable
class AddSubTaskScreen extends StatefulWidget {
  static String id = 'addSubTaskScreen';
  SubTaskData model1;
  @override
  _AddSubTaskScreenState createState() => _AddSubTaskScreenState();
  AddSubTaskScreen(this.model1);
}

class _AddSubTaskScreenState extends State<AddSubTaskScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Sub-tasks'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Sub Task Name',
                  ),
                  TextField(
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Let\'s give a name'),
                    onChanged: (text) {
                      widget.model1.taskName = text;
                    },
                  ),
                  kDivider,
                  Row(
                    children: <Widget>[
                      Text('Status'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.model1.percentageCompletion.toString()),
                      Text('%'),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.blue[700],
                      inactiveTrackColor: Colors.blue[100],
                      trackShape: RoundedRectSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      thumbColor: Colors.blueAccent,
                      overlayColor: Colors.blue.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.blue[700],
                      inactiveTickMarkColor: Colors.blue[100],
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.blueAccent,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: Slider(
                      value: widget.model1.percentageCompletion.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 10,
                      label: widget.model1.percentageCompletion.toString(),
                      onChanged: (value) {
                        setState(
                          () {
                            widget.model1.percentageCompletion = value.round();
                          },
                        );
                      },
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.lightBlueAccent,
                  )
                ]),
          ),
        ));
  }
}

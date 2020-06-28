import 'dart:convert';

import 'package:achieveit/models/goals.dart';
import 'package:achieveit/screens/addSubTask_screen.dart';
import 'package:achieveit/models/subtask.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:achieveit/constants.dart';
import 'package:intl/intl.dart';

final _fireStore = Firestore.instance;
final databaseReference = FirebaseDatabase.instance.reference();

// ignore: must_be_immutable
class CreateGoalScreen extends StatefulWidget {
  List<SubTaskData> subTasks = List<SubTaskData>();
  Goal goal;
//  static String id = 'createGoal_screen';

  @override
  _CreateGoalScreenState createState() => _CreateGoalScreenState();
  CreateGoalScreen(this.goal);
}

class _CreateGoalScreenState extends State<CreateGoalScreen> {
  final taskTextController = TextEditingController();
  final format = DateFormat("yyyy-MM-dd");
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create A Goal'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                ' Name of Goal',
                style: kTextStyle,
              ),
              TextField(
                onChanged: (value) {
                  //var taskName = value;
                  widget.goal.goalName = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your goal here...'),
              ),
              kDivider,
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Sub-Tasks',
                        style: kTextStyle,
                      ),
                      if (widget.goal.subTasks.length > 0)
                        getTextWidgets(widget.goal.subTasks)
                    ],
                  ),
                  Spacer(flex: 4),
                  FlatButton(
                    child: Text(
                      '+',
                      style: TextStyle(color: Colors.black54),
                    ),
                    onPressed: () {
                      SubTaskData model1 = SubTaskData(0, "");
                      widget.goal.subTasks.add(model1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddSubTaskScreen(model1)));
                    },
                  )
                ],
              ),
              kDivider,
              Row(
                children: <Widget>[
                  Text(
                    'Due Date',
                    style: kTextStyle,
                  ),
                  Spacer(flex: 4),
                  IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020, 01, 01),
                          lastDate: DateTime(2022, 12, 31),
                        ).then((date) {
                          setState(() {
                            widget.goal.dueDate =
                                date != null ? format.format(date) : '';
                          });
                        });
                      }),
                ],
              ),
              Text(_dateTime != null ? format.format(_dateTime) : ''),
              kDivider,
              Center(
                child: FlatButton(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    databaseReference
                        .child('goals')
                        .set(jsonEncode(widget.goal));
                    Navigator.pop(context);
                  },
                  color: Colors.lightBlueAccent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget getTextWidgets(List<SubTaskData> st) {
  return new Row(
      children: st.map((item) => new Text(item.getGoalName())).toList());
}

import 'package:achieveit/screens/addSubTask_screen.dart';
import 'package:achieveit/screens/subtask_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:achieveit/constants.dart';
import 'package:intl/intl.dart';

final _fireStore = Firestore.instance;

// ignore: must_be_immutable
class CreateGoalScreen extends StatefulWidget {
  List<SubTaskData> subtasks = List<SubTaskData>();

  static String id = 'createGoal_screen';
  CreateGoalScreen({@required this.status, @required this.taskName});
  final int status;
  final String taskName;

  @override
  _CreateGoalScreenState createState() => _CreateGoalScreenState();
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
                  var taskName = value;
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
                      if (widget.subtasks.length > 0)
                        getTextWidgets(widget.subtasks)
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
                      widget.subtasks.add(model1);
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
                            _dateTime = date;
                          });
                        });
                      }),
                ],
              ),
              Text(_dateTime != null ? format.format(_dateTime) : ''),
              kDivider,
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

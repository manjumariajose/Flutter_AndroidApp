import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

class Goal {
  Goal(this.goalName, this.dueDate, this.subTasks);
  String goalName;
  String dueDate;
  List subTasks;
  String key;
  Goal.fromSnapshot(DataSnapshot snapshot) : key = snapshot.key;

  Map toJson() => {
        'goalName': goalName,
        'dueDate': dueDate,
        'subTasks': jsonEncode(subTasks)
      };
}

import 'package:flutter/material.dart';

class ActiveGoalScreen extends StatefulWidget {
  static String id = 'activeGoal_screen';
  @override
  _ActiveGoalScreenState createState() => _ActiveGoalScreenState();
}

class _ActiveGoalScreenState extends State<ActiveGoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Active Goals'),
      ),
    );
  }
}

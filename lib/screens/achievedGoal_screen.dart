import 'package:flutter/material.dart';

class AchievedGoalScreen extends StatefulWidget {
  static String id = 'achievedGoal_screen';
  @override
  _AchievedGoalScreenState createState() => _AchievedGoalScreenState();
}

class _AchievedGoalScreenState extends State<AchievedGoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achieved Goals'),
      ),
    );
  }
}

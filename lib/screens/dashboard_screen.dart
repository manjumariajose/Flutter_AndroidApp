import 'package:achieveit/screens/activeGoal_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:achieveit/components/text_widget.dart';
import 'createGoal_screen.dart';
import 'achievedGoal_screen.dart';
import 'achievedGoal_screen.dart';

class DashboardScreen extends StatefulWidget {
  static const String id = 'dashboard_screen';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  void getCurrentUser() async {
    final user = await _auth.currentUser();
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Text('Dashboard'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextWidget(
              text: 'Create a Goal',
              onPress: () {
                Navigator.pushNamed(context, CreateGoalScreen.id);
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            TextWidget(
              text: 'Active Goals',
              onPress: () {
                Navigator.pushNamed(context, ActiveGoalScreen.id);
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            TextWidget(
              text: 'Achieved Goals',
              onPress: () {
                Navigator.pushNamed(context, AchievedGoalScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}

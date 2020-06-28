import 'package:achieveit/screens/activeGoal_screen.dart';
import 'package:flutter/material.dart';
import 'package:achieveit/screens/welcome_screen.dart';
import 'package:achieveit/screens/login_screen.dart';
import 'package:achieveit/screens/registration_screen.dart';
import 'package:achieveit/screens/dashboard_screen.dart';
import 'package:achieveit/screens/createGoal_screen.dart';
import 'package:achieveit/screens/achievedGoal_screen.dart';
import 'package:achieveit/screens/addSubTask_screen.dart';

void main() => runApp(AchieveIt());

class AchieveIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: WelcomeScreen.id, routes: {
      WelcomeScreen.id: (context) => WelcomeScreen(),
      LoginScreen.id: (context) => LoginScreen(),
      RegistrationScreen.id: (context) => RegistrationScreen(),
      DashboardScreen.id: (context) => DashboardScreen(),
      //     CreateGoalScreen.id: (context) => CreateGoalScreen(),
      AchievedGoalScreen.id: (context) => AchievedGoalScreen(),
      ActiveGoalScreen.id: (context) => ActiveGoalScreen(),
      //AddSubTaskScreen.id: (context) => AddSubTaskScreen(),
    });
  }
}

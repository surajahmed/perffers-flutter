import 'package:flutter/material.dart';
import 'package:perffers/Screens/QuestionChat/index.dart';
import 'package:perffers/Screens/AskQuestion/index.dart';
import 'package:perffers/Screens/Question/index.dart';
import 'package:perffers/Screens/Login/index.dart';
import 'package:perffers/Screens/Home/index.dart';
import 'Screens/MyQuestions/index.dart';

void main() => runApp(MaterialApp(
      title: 'Navigation Basics',
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new Home(),
        '/askQuestion': (BuildContext context) => new AskQuestion(),
        '/myQuestions': (BuildContext context) => new MyQuestions(),
        '/questionChat': (BuildContext context) => new QuestionChat(),
        '/questions': (BuildContext context) => new QuestionScreen(),
        '/login': (BuildContext context) => new Login(),
      },
    ));

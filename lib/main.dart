import 'package:flutter/material.dart';
import 'package:perffers/Screens/QuestionChat/index.dart';
import 'package:perffers/Screens/AskQuestion/index.dart';
import 'package:perffers/Screens/Question/index.dart';
import 'package:perffers/Screens/Login/index.dart';
import 'package:perffers/Screens/Home/index.dart';

void main() => runApp(MaterialApp(
      title: 'Navigation Basics',
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new Home(),
        '/askQuestion': (BuildContext context) => new AskQuestion(),
        '/questionChat': (BuildContext context) => new QuestionChat(),
        '/questions': (BuildContext context) => new QuestionScreen(),
        '/login': (BuildContext context) => new Login(),
      },
    ));

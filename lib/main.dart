import 'package:flutter/material.dart';
import 'package:perffers/Screens/QuestionChat/index.dart';
import 'package:perffers/Screens/Question/index.dart';
import 'package:perffers/Screens/Login/index.dart';

void main() => runApp(MaterialApp(
      title: 'Navigation Basics',
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/questionChat': (BuildContext context) => new QuestionChat(),
        '/questions': (BuildContext context) => new QuestionScreen(),
        '/login': (BuildContext context) => new Login(),
      },
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: Row(
          children: <Widget>[
            RaisedButton(
              child: Text('Open route'),
              onPressed: () {
                Navigator.of(context).pushNamed('/questionChat');
              },
            ),
            RaisedButton(
              child: Text('Questions'),
              onPressed: () {
                Navigator.of(context).pushNamed('/questions');
              },
            ),
            RaisedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
            ),
          ],
        ));
  }
}

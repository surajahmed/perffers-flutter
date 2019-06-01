import 'package:flutter/material.dart';
import 'package:perffers/Screens/QuestionChat/index.dart';
import 'package:perffers/Screens/Question/index.dart';

void main() => runApp(MaterialApp(
      title: 'Navigation Basics',
      home: QuestionScreen(),
      routes: <String, WidgetBuilder>{
        '/questionChat': (BuildContext context) => new QuestionChat(),
        '/questions': (BuildContext context) => new QuestionScreen(),
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
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:perffers/Screens/QuestionChat/index.dart';

void main() => runApp(MaterialApp(
      title: 'Navigation Basics',
      home: MyApp(),
      routes: <String, WidgetBuilder>{
        '/questionChat': (BuildContext context) => new QuestionChat(),
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
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.of(context).pushNamed('/questionChat');
          },
        ),
      ),
    );
  }
}

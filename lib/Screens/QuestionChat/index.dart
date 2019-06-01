import 'package:flutter/material.dart';

class QuestionChat extends StatelessWidget {
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

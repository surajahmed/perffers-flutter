import 'package:flutter/material.dart';
import 'package:perffers/Screens/QuestionChat/index.dart';
import 'package:perffers/Screens/AskQuestion/index.dart';
import 'package:perffers/Screens/Question/index.dart';

void main() => runApp(MaterialApp(
      title: 'Navigation Basics',
      home: MyApp(),
      routes: <String, WidgetBuilder>{
        '/askQuestion': (BuildContext context) => new AskQuestion(),
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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ashish Rawat"),
                accountEmail: Text("ashishrawat2911@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text("Answer Questions"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => QuestionScreen()));
                },
              ),
              ListTile(
                title: Text("Ask Questions"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          QuestionScreen())); // TODO: add ask question screen
                },
              ),
              ListTile(
                title: Text("Logout"),
                onTap: () {
                  // TODO: logout here
                },
              ),
            ],
          ),
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

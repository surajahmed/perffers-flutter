import 'package:flutter/material.dart';
import 'package:perffers/Screens/AskQuestion/index.dart';
import 'package:perffers/Screens/Login/index.dart';
import 'package:perffers/Screens/MyQuestions/index.dart';
import 'package:perffers/Screens/Question/index.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Suraj Ahmed"),
                accountEmail: Text("suraj@geekyants.com"),
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
                title: Text("My Questions"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyQuestions()));
                },
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
                      builder: (BuildContext context) => AskQuestion()));
                },
              ),
              ListTile(
                title: Text("Logout"),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
                },
              ),
            ],
          ),
        ),
        body:
            Center(child: new Text("Tech Pair", style: TextStyle(fontSize: 40)))
        // body: Row(
        //   children: <Widget>[
        // RaisedButton(
        //   child: Text('Open route'),
        //   onPressed: () {
        //     Navigator.of(context).pushNamed('/questionChat');
        //   },
        // ),
        // RaisedButton(
        //   child: Text('Questions'),
        //   onPressed: () {
        //     Navigator.of(context).pushNamed('/questions');
        //   },
        // ),
        // ],
        // )
        );
  }
}

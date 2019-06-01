import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AskQuestion extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Ask a question'),
        ),
        body: new Container(
          margin: new EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[
              new Text(
                "Type your question",
                style: TextStyle(fontSize: 20),
              ),
              new Container(
                  child: new TextField(
                      maxLines: 6,
                      style: TextStyle(
                          color: Color.fromRGBO(00, 00, 00, 1),
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal),
                      key: key,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      onChanged: (String email) {
                        // user.email = email;
                      },
                      decoration: new InputDecoration())),
              new InkWell(
                onTap: () => {},
                child: new Container(
                  width: screenSize.width,
                  height: 50.0,
                  margin: new EdgeInsets.all(20.0),
                  alignment: FractionalOffset.center,
                  decoration: new BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(30.0)),
                  ),
                  child: new Text("Post Question",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ));
  }
}

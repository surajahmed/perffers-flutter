import 'package:flutter/material.dart';

class QuestionChat extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Question'),
        ),
        body: new Container(
            margin: new EdgeInsets.all(16),
            child: new Column(
              children: <Widget>[
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.lightbulb_outline),
                        title: Text('The Enchanted Nightingale'),
                        subtitle: Text('Some random question'),
                      ),
                    ],
                  ),
                ),
                // new Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                Flexible(
                  flex: 1,
                  child: new Container(),
                ),

                new Container(
                    height: 70.0,
                    child: new TextFormField(
                        style: TextStyle(
                            color: Color.fromRGBO(00, 00, 00, 1),
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal),
                        key: key,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        onSaved: (String email) {
                          // user.email = email;
                        },
                        decoration: new InputDecoration(
                          hintText: "Type your answer",
                        ))),
              ],
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionChat extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Question'),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.lightbulb_outline),
                      title: Text('Some random question'),
                    ),
                  ],
                ),
              ),
              new Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection(
                              'questions/k5UQFYaq4JV3ggJhQI1a/question_messages')
                          .orderBy("created_at")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError)
                          return new Text('Error: ${snapshot.error}');
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
                          default:
                            return new ListView(
                              children: snapshot.data.documents
                                  .map((DocumentSnapshot document) {
                                return new Container(
                                  margin: const EdgeInsets.all(5.0),
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      new Text("User",
                                          style: new TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      new Container(
                                        margin: const EdgeInsets.only(top: 5.0),
                                        child: new Text(document['message']),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                        }
                      },
                    )),
              ),
              new Divider(height: 1.0),
              new Container(
                decoration:
                    new BoxDecoration(color: Theme.of(context).cardColor),
                child: new Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: new Row(
                    children: <Widget>[
                      new Flexible(
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
                      new Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: new IconButton(
                              icon: new Icon(Icons.send),
                              onPressed: () => {
                                    Navigator.of(context)
                                        .pushNamed('/askQuestion')
                                  })),
                    ],
                  ),
                ),
              ),
            ],
          ),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
                  border: new Border(
                      top: new BorderSide(
                  color: Colors.grey[200],
                )))
              : null,
        ));
  }
}

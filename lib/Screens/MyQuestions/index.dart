import 'package:flutter/material.dart';
import 'package:perffers/Screens/QuestionChat/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyQuestions extends StatelessWidget {
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
                      title: Text('Your questions'),
                    ),
                  ],
                ),
              ),
              new Flexible(
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection('questions')
                          .where("user_id",
                              isEqualTo: "V9BPdjICY0Wr0lPnkbZy1a6x4kH3")
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Card(
                                          child: ListTile(
                                              title: Text(document['caption']),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            new QuestionChat()));
                                              })),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                        }
                      },
                    )),
              ),
            ],
          ),
        ));
  }
}

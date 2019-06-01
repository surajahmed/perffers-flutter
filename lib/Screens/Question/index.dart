import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:perffers/Screens/AskQuestion/index.dart';
import 'package:perffers/Screens/QuestionChat/index.dart';
import 'package:perffers/Screens/AskQuestion/index.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen() : super();
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final items = List<String>.generate(5, (i) => "Item ${i + 1}");
  renderQuestions() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('questions').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            var index = 0.0;
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: Stack(
                              alignment: Alignment.center,
                              children: snapshot.data.documents
                                  .map((DocumentSnapshot document) {
                                var item = document["caption"];
                                index++;
                                return Dismissible(
                                    key: Key(item),
                                    onDismissed: (direction) {
                                      items.remove(item);
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text("$item dismissed")));
                                    },
                                    child: Card(
                                      margin: EdgeInsets.only(
                                          top: index * 5, left: index * 5),
                                      elevation: index * 8,
                                      color: Colors.grey[300],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        width: 300,
                                        height: 450,
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Text(
                                              item,
                                              style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  fontSize: 20),
                                            ),
                                            RaisedButton(
                                              color: Colors.teal,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          new QuestionChat(
                                                              id: document
                                                                  .documentID,
                                                              question: item)),
                                                );
                                              },
                                              child: const Text(
                                                'Answer Question',
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ));
                              }).toList()))
                    ]));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer a question'),
      ),
      body: this.renderQuestions(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new AskQuestion()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

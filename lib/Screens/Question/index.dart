import 'package:flutter/material.dart';
import 'package:perffers/Screens/QuestionChat/index.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final items = List<String>.generate(5, (i) => "Item ${i + 1}");
  List<Widget> renderCards() {
    List<Widget> list = [];

    items.forEach((item) {
      double index =
          items.indexOf(item).toDouble(); // TODO: find other way to get index
      list.add(Center(
          child: Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                items.remove(item);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("$item dismissed")));
              },
              child: Card(
                margin: EdgeInsets.only(top: index * 5, left: index * 5),
                elevation: index * 8,
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 250,
                  height: 400,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(item),
                      RaisedButton(
                        color: Colors.teal,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new QuestionChat()),
                          );
                        },
                        child: const Text(
                          'Answer Question',
                        ),
                      ),
                    ],
                  )),
                ),
              ))));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer a question'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Stack(
                      alignment: Alignment.center,
                      children: this.renderCards()))
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    new QuestionChat()), // TODO: change this to ask question
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

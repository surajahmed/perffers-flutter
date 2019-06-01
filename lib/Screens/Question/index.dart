import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  QuestionScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 10,
              child: Card(
                elevation: 4,
                color: Color.fromARGB(255, 0, 0, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 200,
                  height: 300,
                ),
              ),
            ),
            Positioned(
              top: 20,
              child: Card(
                elevation: 8,
                color: Color.fromARGB(255, 0, 255, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 220,
                  height: 300,
                ),
              ),
            ),
            Positioned(
              top: 30,
              child: Card(
                elevation: 12,
                color: Color.fromARGB(255, 200, 0, 0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  width: 240,
                  height: 300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

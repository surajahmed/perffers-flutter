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
              new Flexible(
                child: Container(),
                // new FirebaseAnimatedList(
                //   query: reference,
                //   padding: const EdgeInsets.all(8.0),
                //   reverse: true,
                //   sort: (a, b) => b.key.compareTo(a.key),
                //   //comparing timestamp of messages to check which one would appear first
                //   itemBuilder: (_, DataSnapshot messageSnapshot,
                //       Animation<double> animation) {
                //     return new ChatMessageListItem(
                //       messageSnapshot: messageSnapshot,
                //       animation: animation,
                //     );
                //   },
                // ),
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
                              icon: new Icon(Icons.send), onPressed: () => {})),
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

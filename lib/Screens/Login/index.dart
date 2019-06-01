import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perffers/Screens/Login/google_sign_in_button.dart';
import 'package:perffers/state_widget.dart';

import '../../google_login.dart';
// import 'package:perffers/state_widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // Private methods within build method help us to
    // organize our code and recognize structure of widget
    // that we're building:
    // BoxDecoration _buildBackground() {
    //   return BoxDecoration(
    //     image: DecorationImage(
    //       // image: AssetImage("assets/brooke-lark-385507-unsplash.jpg"),
    //       fit: BoxFit.cover,
    //     ),
    //   );
    // }

    Text _buildText() {
      return Text(
        'Tech Pair',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      );
    }

    String _randomString(int length) {
      var rand = new Random();
      var codeUnits = new List.generate(length, (index) {
        return rand.nextInt(33) + 89;
      });

      return new String.fromCharCodes(codeUnits);
    }

    onPressed() {
      // String randomToken = _randomString(20);
      try {
        StateWidget.of(context).signInWithGoogle();
      } catch (err) {
        print(err.toString());
      } finally {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed('/home');
        // Navigator.of(context).pushReplacement(
        // MaterialPageRoute(builder: (context) => Home(randomToken)));
      }
    }

    return Scaffold(
      body: Container(
        // decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Tech Pair',
                style: Theme.of(context).textTheme.headline,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.0),
              GoogleSignInButton(
                  // Passing function callback as constructor argument:
                  onPressed: onPressed)
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:perffers/Screens/Login/google_sign_in_button.dart';
import 'package:perffers/state_widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  @override
  Widget build(BuildContext context) {
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
                onPressed: () => Navigator.of(context).pushNamed('/home'),
                // onPressed: () => StateWidget.of(context).signInWithGoogle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

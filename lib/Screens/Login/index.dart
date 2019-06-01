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
        'Recipes',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      body: Container(
        // decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildText(),
              SizedBox(height: 50.0),
              GoogleSignInButton(
                // Passing function callback as constructor argument:
                onPressed: () => StateWidget.of(context).signInWithGoogle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'LoginPage.dart';
import 'SignUpPage.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello User!!'),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
          onPressed: navigatetoSignIn,
          child: Text('Sign In'),
        ),
        RaisedButton(
          onPressed: navigatetoSignUp,
          child: Text('Sign Up'),
        ),
      ]),
    );
  }

  void navigatetoSignIn() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void navigatetoSignUp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }
}

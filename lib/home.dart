import 'package:fab_assistant/Welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  FirebaseAuth user;
  String email;
  Home(FirebaseAuth user, String email) {
    this.user = user;
    this.email = email;
  }
  @override
  _HomeState createState() => new _HomeState(email);
}

class _HomeState extends State<Home> {
  String email;
  _HomeState(String email) {
    this.email = email;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(email),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: LogOut,
            child: Text('Log Out'),
          )
        ],
      ),
    );
  }

  void LogOut() async {
    await widget.user.signOut();
    Navigator.pop(context);
  }
}

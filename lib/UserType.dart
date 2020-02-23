import 'package:flutter/material.dart';
import 'Admin/LoginPage.dart';
import 'Student/Welcome.dart';

class UserType extends StatefulWidget {
  
  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('What are You??'),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
          onPressed: navigatetoSignIn,
          child: Text('Admin'),
        ),
        RaisedButton(
          onPressed: navigatetoWelcome,
          child: Text('Student'),
        ),
      ]),
    );
  }

  void navigatetoSignIn() {
        Navigator.push(this.context, MaterialPageRoute(builder: (context) => Admin()));
  }

  void navigatetoWelcome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
  }
}

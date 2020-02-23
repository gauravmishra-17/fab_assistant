import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fab_assistant/Student/UserAccount/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String adminEmail;
  String adminPassword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            StreamBuilder(
                stream: Firestore.instance.collection('User').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return Text('loading data');
                  adminPassword = snapshot.data.documents[0]['password'];
                  adminEmail = snapshot.data.documents[0]['email'];
                  print(adminEmail);
                  print(adminPassword);
                  return Container();
                }),
            TextFormField(
              onSaved: (input) => _email = input,
              validator: (input) {
                print(_email);
                if (adminEmail != input) return 'Not a valid email';
              },
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              onSaved: (input) => _password = input,
              validator: (input) {
                print(_password);
                if (adminPassword != input) return 'Invalid Password';
              },
              decoration: InputDecoration(labelText: 'Password'),
            ),
            RaisedButton(onPressed: signIn, child: Text('Sign In'))
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(FirebaseAuth.instance, _email),
            ));
      } catch (e) {
        print(e.message);
      }
    }
  }
}

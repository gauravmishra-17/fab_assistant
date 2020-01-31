import 'package:flutter/material.dart';

import 'package:fab_assistant/Welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fab Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Welcome(),
    );
  }
}

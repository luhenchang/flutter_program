import 'package:flutter/material.dart';
import 'package:flutter_program/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_program/LoginFlutter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryIconTheme:IconThemeData(color: Colors.white),
        //primarySwatch: Colors.blue,
      ),
      home: new LoginFlutter(),
    );
  }
}
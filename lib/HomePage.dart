import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'haha',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new HomePager("哈哈"),
  ));
}

class HomePager extends StatefulWidget {
  String title;
  HomePager(var title){
   this.title=title;
  }
  @override
  _HomePagerState createState() => new _HomePagerState(title);
}

class _HomePagerState extends State<HomePager> {
  String title;
  _HomePagerState(String title){
    this.title=title;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:Center(
        child: Text(title),
      ),
    );
  }
}
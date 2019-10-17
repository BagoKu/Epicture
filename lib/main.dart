import 'package:flutter_app/navbar.dart';

import './homePage.dart';
//import 'account.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: NavBar(),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        //home: MyHomePage(title: 'Random Pics'),
        home: Scaffold(
          appBar: AppBar(
            title: Text('bite'),
          ),
        ));
  }
}
*/
import 'package:flutter/material.dart';
import 'nav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iwfp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DestView(),
    );
  }
}

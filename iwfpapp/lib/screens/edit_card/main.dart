import 'package:flutter/material.dart';

class EditCardScreen extends StatefulWidget {
  @override
  _EditCardScreen createState() {
    return _EditCardScreen();
  }
}

class _EditCardScreen extends State<EditCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Card'),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan[100],
    );
  }
}
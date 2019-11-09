import 'package:flutter/material.dart';

class RemoveCardScreen extends StatefulWidget {
  @override
  _RemoveCardScreen createState() {
    return _RemoveCardScreen();
  }
}

class _RemoveCardScreen extends State<RemoveCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Card'),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan[100],
    );
  }
}
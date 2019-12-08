import 'package:flutter/material.dart';

class AddCardFromTemplateScreen extends StatefulWidget {
  const AddCardFromTemplateScreen({Key key}) : super(key: key);
  @override
  _AddCardFromTemplateScreen createState() {
    return _AddCardFromTemplateScreen();
  }
}

class _AddCardFromTemplateScreen extends State<AddCardFromTemplateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: Text('Add Card from Templates'),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
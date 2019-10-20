import 'package:flutter/material.dart';

class SuggestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I Should Use ...'),
        backgroundColor: Colors.purple,
        key: Key('suggestion_title'),
      ),
      backgroundColor: Colors.purple,
    );
  }
}

import 'package:flutter/material.dart';

class UnknownError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Whoops! Unknown Error!')
        ],
      ),
    );
  }
}
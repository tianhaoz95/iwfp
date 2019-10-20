import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Under Construction'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/coming_soon.png',
              key: Key('coming_soon_img'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.pink[100],
    );
  }
}
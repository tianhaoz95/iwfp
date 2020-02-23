import 'package:flutter/material.dart';

class AddCardScreenLoadingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          LinearProgressIndicator(
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Text('Adding credit card to your wallet...'),
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Text('Please be patient...'),
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: Text('This should take a few seconds...'),
          ),
        ],
      ),
    );
  }
}

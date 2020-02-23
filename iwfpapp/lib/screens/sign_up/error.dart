import 'package:flutter/material.dart';

class SignUpScreenErrorContent extends StatelessWidget {
  final errMsg;
  const SignUpScreenErrorContent({this.errMsg});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Text(this.errMsg),
          Material(
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Error, back to login'),
            ),
          ),
        ],
      ),
    );
  }
}

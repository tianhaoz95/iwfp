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
                Navigator.pushReplacementNamed(context, '/sign_in');
              },
              child: Text('Error, back to login'),
            ),
          ),
        ],
      ),
    );
  }
}

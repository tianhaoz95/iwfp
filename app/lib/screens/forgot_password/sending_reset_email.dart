import 'package:flutter/material.dart';

class SendingResetEmail extends StatelessWidget {
  final String email;
  const SendingResetEmail({@required this.email});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          LinearProgressIndicator(
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 35.0,
          ),
          Container(
            child: Center(
              child: Text('Sending password reset email to'),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Center(
              child: Text(email),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Center(
              child: Text('Please wait...'),
            ),
          ),
        ],
      ),
    );
  }
}

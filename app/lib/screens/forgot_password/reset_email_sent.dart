import 'package:flutter/material.dart';

class ResetEmailSent extends StatelessWidget {
  final String email;
  const ResetEmailSent({@required this.email});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 35.0,
          ),
          Container(
            child: Center(
              child: Text('An email with instructions to reset password'),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Center(
              child: Text('has been sent to'),
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
              child: Text('Please follow the steps and check back later'),
            ),
          ),
        ],
      ),
    );
  }
}

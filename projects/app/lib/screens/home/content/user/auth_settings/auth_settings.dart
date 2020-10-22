import 'package:flutter/material.dart';

class AuthSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              'Authentication',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          RaisedButton(
            key: Key('go_to_auth_btn'),
            color: Colors.amber[900],
            child: Text(
              'Sign out',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/sign_in');
            },
          ),
        ],
      ),
    );
  }
}

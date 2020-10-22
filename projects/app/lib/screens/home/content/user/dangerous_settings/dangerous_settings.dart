import 'package:flutter/material.dart';

class DangerousSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              'Dangerous',
              style: TextStyle(fontSize: 24.0, color: Colors.redAccent),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/delete_account');
            },
            color: Colors.redAccent,
            child: Text(
              'Delete Account',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

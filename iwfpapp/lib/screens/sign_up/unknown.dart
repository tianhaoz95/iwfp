import 'package:flutter/material.dart';

class SignUpScreenUnknownContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Material(
              color: Colors.blue[100],
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Unknown Error! Go Back!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              )),
        ],
      ),
    );
  }
}

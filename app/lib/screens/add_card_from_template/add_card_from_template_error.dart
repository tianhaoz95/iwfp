import 'package:flutter/material.dart';

class AddCardFromTemplateError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        SizedBox(
          height: 5.0,
        ),
        Material(
          color: Colors.cyan[100],
          child: Card(
            color: Colors.cyan,
            child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                child: Text('Error using template',
                    style: TextStyle(color: Colors.white))),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          child: RaisedButton(
            color: Colors.redAccent,
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text('Back', style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    ));
  }
}

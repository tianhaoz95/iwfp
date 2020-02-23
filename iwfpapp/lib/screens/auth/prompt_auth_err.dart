import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<void> promptAuthError(
    BuildContext context, String title, String body, String key) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            FlatButton(
              key: Key(key),
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

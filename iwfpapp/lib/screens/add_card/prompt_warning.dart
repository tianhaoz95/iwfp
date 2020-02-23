import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future<void> promptAddCardWarning(BuildContext context, List<String> messages) async {
  List<Widget> content = messages.map((String message) {
    return Text(message);
  }).toList();
  await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: content,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

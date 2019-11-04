import 'package:flutter/material.dart';

class UserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key('contrib_screen_content'),
        padding: const EdgeInsets.all(36.0),
        child: ListView(
          children: <Widget>[
            Text('Coming soon... You don\'t have settings anyway lol.',
                style: TextStyle(color: Colors.orange)),
          ],
        ));
  }
}

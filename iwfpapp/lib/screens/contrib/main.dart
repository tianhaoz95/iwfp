import 'package:flutter/material.dart';

class Contrib extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key('contrib_screen_content'),
        padding: const EdgeInsets.all(36.0),
        child: ListView(
          children: <Widget>[
            Text('Any kind of contribution is appreciated!',
                style: TextStyle(color: Colors.blue)),
            SizedBox(height: 25.0),
            Text('1. Contribute to repository (code, docs, issues, etc)',
                style: TextStyle(color: Colors.blue)),
            SizedBox(height: 25.0),
            Text('2. Send me bug reports or user experiences',
                style: TextStyle(color: Colors.blue)),
            SizedBox(height: 25.0),
            Text('3. Sponsor the project',
                style: TextStyle(color: Colors.blue)),
            SizedBox(height: 25.0),
            Text('4. Coming soon...', style: TextStyle(color: Colors.blue))
          ],
        ));
  }
}

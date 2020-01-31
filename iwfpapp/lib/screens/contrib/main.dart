import 'package:flutter/material.dart';

/// This screen shows the ways users can contribute
/// to I want 5% project.
/// 
/// {@category Screens}
class Contrib extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key('contrib_screen_content'),
        padding: const EdgeInsets.all(36.0),
        child: ListView(
          children: <Widget>[
            Text('Any kind of contribution is appreciated!'),
            SizedBox(height: 25.0),
            Text('1. Contribute to repository (code, docs, issues, etc)'),
            SizedBox(height: 25.0),
            Text('2. Send me bug reports or user experiences'),
            SizedBox(height: 25.0),
            Text('3. Sponsor the project'),
            SizedBox(height: 25.0),
            Text('4. Coming soon...')
          ],
        ));
  }
}

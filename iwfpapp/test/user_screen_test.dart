import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iwfpapp/screens/user/main.dart';

void main() {
  testWidgets('test user widget render no crash', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone user widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserSettings(),
    ));
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iwfpapp/screens/contrib/main.dart';

void main() {
  testWidgets('test contrib widget render no crash',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone contrib widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Contrib(),
    ));
  });
}

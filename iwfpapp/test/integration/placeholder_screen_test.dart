import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iwfpapp/screens/placeholder/main.dart';

void main() {
  testWidgets('test placeholder widget render no crash', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone cards widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlaceholderScreen(),
    ));
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iwfpapp/cards.dart';

void main() {
  testWidgets('test cards widget render no crash', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone cards widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ManageCard(),
    ));
  });
}

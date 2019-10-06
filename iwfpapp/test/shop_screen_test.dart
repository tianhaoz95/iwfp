import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iwfpapp/screens/shop/main.dart';

void main() {
  testWidgets('test shop widget render no crash', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone shop widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShopNow(),
    ));
  });
}

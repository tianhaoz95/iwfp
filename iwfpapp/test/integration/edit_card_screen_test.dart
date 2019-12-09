import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/edit_card/main.dart';

void main() {
  testWidgets('test edit card screen render no crash',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone sign in screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EditCardScreen(),
    ));
  });
}

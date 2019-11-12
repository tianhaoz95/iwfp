import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/user/main.dart';
import 'package:iwfpapp/services/mode.dart';
import './mock_mode.dart';

void main() {
  testWidgets('test user widget render no crash', (WidgetTester tester) async {
    RunningMode mockMode = MockRunningMode();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone user widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserSettings(mockMode),
    ));
  });
}

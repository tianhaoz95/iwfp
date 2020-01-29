import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/user/main.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'mock_services/mock_context.dart';

void main() {
  testWidgets('test user widget render no crash', (WidgetTester tester) async {
    AppContext mockedAppContext = MockAppContext();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone user widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserSettings(mockedAppContext),
    ));
  });
}

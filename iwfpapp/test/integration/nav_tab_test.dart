import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/services/mode.dart';
import 'package:iwfpapp/nav.dart';
import './mock_mode.dart';

void main() {
  testWidgets('test app render no crash', (WidgetTester tester) async {
    RunningMode mockMode = MockRunningMode();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone contrib widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DestView(mockMode),
    ));
    await tester.pump(new Duration(seconds: 5));
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}

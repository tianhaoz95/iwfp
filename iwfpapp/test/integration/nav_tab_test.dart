import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/mode.dart';
import 'package:iwfpapp/nav.dart';
import './mock_mode.dart';
import './mock_data_store.dart';

void main() {
  testWidgets('test app render no crash', (WidgetTester tester) async {
    RunningMode mockMode = MockRunningMode();
    DataStore mockDataStore = MockDataStore();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone contrib widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DestView(mockMode, mockDataStore),
    ));
    await tester.pump(new Duration(seconds: 5));
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}

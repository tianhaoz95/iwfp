import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/cards/main.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'mock_data_store.dart';

void main() {
  testWidgets('test cards widget render no crash', (WidgetTester tester) async {
    DataStore mockDataStore = MockDataStore();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone cards widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ManageCard(mockDataStore),
    ));
    await tester.pumpAndSettle(new Duration(seconds: 5));
  });
}

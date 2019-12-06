import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/suggestion/main.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'mock_data_store.dart';
import 'screen_validator.dart';

void main() {
  testWidgets('test contrib widget render no crash',
      (WidgetTester tester) async {
    DataStore mockDataStore = MockDataStore();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone contrib widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SuggestionScreen(mockDataStore),
    ));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateSuggestionScreenContent();
  });
}

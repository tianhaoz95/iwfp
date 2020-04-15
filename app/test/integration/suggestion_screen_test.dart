import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/suggestion/main.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'mock_services/mock_data_store.dart';
import 'validators/screen_validator.dart';

void main() {
  testWidgets('test contrib widget render no crash',
      (WidgetTester tester) async {
    DataBackend mockDataBackend = MockDataBackend();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone contrib widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SuggestionScreen(mockDataBackend),
    ));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateSuggestionScreenContent();
  });
}

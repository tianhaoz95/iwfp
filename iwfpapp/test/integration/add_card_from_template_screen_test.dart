import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/add_card_from_template/main.dart';
import 'package:iwfpapp/services/data_store.dart';

import 'mock_services/mock_data_store.dart';

void main() {
  testWidgets('test add card from template screen render no crash',
      (WidgetTester tester) async {
    DataStore mockDataStore = MockDataStore();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone sign in screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddCardFromTemplateScreen(mockDataStore),
    ));
  });
}

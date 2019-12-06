import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/shop/main.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'mock_data_store.dart';
import 'screen_validator.dart';

void main() {
  testWidgets('test shop widget render no crash', (WidgetTester tester) async {
    DataStore mockDataStore = MockDataStore();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone shop widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShopNow(mockDataStore),
    ));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateShopScreenContent();
  });
}

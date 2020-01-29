import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/shop/main.dart';
import 'package:iwfpapp/services/data_store/base.dart';
import 'mock_services/mock_data_store.dart';
import 'validators/screen_validator.dart';

void main() {
  testWidgets('test shop widget render no crash', (WidgetTester tester) async {
    DataBackend mockDataBackend = MockDataBackend();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone shop widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShopNow(mockDataBackend),
    ));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateShopScreenContent();
  });
}

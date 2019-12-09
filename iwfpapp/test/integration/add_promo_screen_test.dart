import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/add_promo/main.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/data_store.dart';

import 'mock_services/mock_data_store.dart';

void main() {
  testWidgets('test add promo screen render no crash',
      (WidgetTester tester) async {
    DataStore mockDataStore = MockDataStore();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone add promo screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddPromoScreen(
        mockDataStore,
        defaultCard: CreditCard('Mock Card', 'mock_card'),
      ),
    ));
  });
}

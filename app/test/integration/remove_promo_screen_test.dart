import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/screens/remove_promo/main.dart';
import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';

import 'mock_services/mock_data_store.dart';

void main() {
  testWidgets('test remove promo screen render no crash',
      (WidgetTester tester) async {
    DataBackend mockDataBackend = MockDataBackend();
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone remove promo screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RemovePromoScreen(
        mockDataBackend,
        defaultRemovePromoMeta: RemovePromoMeta(
            CreditCard('Mocked Card', 'mocked_card'),
            CashbackPromo(
                'Mocked Promo',
                'mocked_promo',
                'sector',
                'na',
                'na',
                'const',
                5,
                ShopCategory('Mocked Shop Category', 'mocked_shop_category'))),
      ),
    ));
  });
}

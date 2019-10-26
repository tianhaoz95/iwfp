import 'package:flutter/material.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/screens/suggestion/entries.dart';

class SuggestionScreen extends StatelessWidget {
  final List<CreditCard> creditCardMetadataList = [
    CreditCard('card 1'),
    CreditCard('card 2'),
    CreditCard('card 3'),
    CreditCard('card 4')
  ];

  @override
  Widget build(BuildContext context) {
    ShopCategory category = ShopCategory('Unknown Category', 'unknown');
    if (ModalRoute.of(context).settings.arguments != null) {
      category = ModalRoute.of(context).settings.arguments;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('For ' + category.name + ', I should use ...'),
        backgroundColor: Colors.purple,
        key: Key('suggestion_title'),
      ),
      body: SuggestionEntries(category),
      backgroundColor: Colors.purple[100],
    );
  }
}

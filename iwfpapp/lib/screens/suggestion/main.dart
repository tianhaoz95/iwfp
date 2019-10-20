import 'package:flutter/material.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/widgets/credit_cards/basic.dart';

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
      body: Container(
          child: Center(
              child: ListView(
        children: creditCardMetadataList.map((CreditCard card) {
          return BasicCreditCard(card, Colors.purple);
        }).toList(),
      ))),
      backgroundColor: Colors.purple[100],
    );
  }
}

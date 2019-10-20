import 'package:flutter/material.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/widgets/credit_cards/basic.dart';

class ManageCard extends StatelessWidget {
  final List<CreditCard> creditCardMetadataList = [
    CreditCard('card 1'),
    CreditCard('card 2'),
    CreditCard('card 3'),
    CreditCard('card 4')
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: ListView(
      children: creditCardMetadataList.map((CreditCard card) {
        return BasicCreditCard(card, Colors.cyan);
      }).toList(),
    )));
  }
}

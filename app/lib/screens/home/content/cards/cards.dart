import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/cards/empty.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/widgets/credit_cards/basic.dart';

/// card management screen with card list
///
/// {@category Screens}
/// {@subcategory CardManagementScreen}
class CardListCardScreen extends StatelessWidget {
  final List<CreditCard> cards;
  const CardListCardScreen({this.cards});
  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty) {
      return EmptyWalletCardScreen();
    }
    return Container(
        key: Key('suggested_categories'),
        child: Center(
            child: ListView(
          children: cards.map((CreditCard card) {
            return BasicCreditCard(card, Colors.cyan, true);
          }).toList(),
        )));
  }
}

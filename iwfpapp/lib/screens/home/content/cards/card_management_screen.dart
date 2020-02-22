import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/cards/cards.dart';
import 'package:iwfpapp/screens/home/content/cards/empty.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/data_backend/base.dart';

/// This screen shows all the credit cards in user wallet
///
/// {@category Screens}
class ManageCard extends StatefulWidget {
  final DataBackend dataBackend;
  const ManageCard(this.dataBackend, {Key key}) : super(key: key);
  @override
  _ManageCard createState() {
    return _ManageCard();
  }
}

class _ManageCard extends State<ManageCard> {
  Future<List<CreditCard>> cards;

  @override
  void initState() {
    super.initState();
    cards = widget.dataBackend.getCreditCards();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CreditCard>>(
      future: cards,
      builder: (context, snapshot) {
        double contentWidth = min(MediaQuery.of(context).size.width, 600);
        if (snapshot.hasData) {
          if (snapshot.data.isEmpty) {
            return Center(
                child: Container(
              width: contentWidth,
              child: EmptyWalletCardScreen(),
            ));
          } else {
            return Center(
                child: Container(
              width: contentWidth,
              child: CardListCardScreen(
                cards: snapshot.data,
              ),
            ));
          }
        } else if (snapshot.hasError) {
          return Center(child: Text('error'));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

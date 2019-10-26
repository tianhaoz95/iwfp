import 'package:flutter/material.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/fetcher.dart';
import 'package:iwfpapp/widgets/credit_cards/basic.dart';

class ManageCard extends StatefulWidget {
  const ManageCard({Key key}) : super(key: key);

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
    cards = fetchAllCreditCards('tianhaoz95');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CreditCard>>(
      future: cards,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
              key: Key('suggested_categories'),
              child: Center(
                  child: ListView(
                children: snapshot.data.map((CreditCard card) {
                  return BasicCreditCard(card, Colors.cyan);
                }).toList(),
              )));
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

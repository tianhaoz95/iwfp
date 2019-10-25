import 'package:flutter/material.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/fetcher.dart';
import 'package:iwfpapp/widgets/credit_cards/basic.dart';

class SuggestionEntries extends StatefulWidget {
  const SuggestionEntries({Key key}) : super(key: key);

  @override
  _SuggestionEntries createState() {
    return _SuggestionEntries();
  }
}

class _SuggestionEntries extends State<SuggestionEntries> {
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
                  return BasicCreditCard(card, Colors.purple);
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

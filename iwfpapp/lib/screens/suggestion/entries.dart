import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/widgets/credit_cards/basic.dart';

class SuggestionEntries extends StatefulWidget {
  final ShopCategory category;
  final DataStore dataStore;
  const SuggestionEntries(this.category, this.dataStore, {Key key})
      : super(key: key);
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
    // cards = getRankedCards('tianhaoz95', widget.category);
    cards = widget.dataStore.getRankedCards(widget.category);
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
                  /// TOOD(tianhaoz95): here the highest corresponding
                  /// reward rate should show with the card.
                  return BasicCreditCard(card, Colors.teal, false,
                      targetCategory: widget.category);
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

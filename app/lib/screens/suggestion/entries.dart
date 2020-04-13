import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/suggestion/entries_error.dart';
import 'package:iwfpapp/screens/suggestion/entries_outdated.dart';
import 'package:iwfpapp/screens/suggestion/fetching_entries.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/widgets/credit_cards/basic.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:provider/provider.dart';

class SuggestionEntries extends StatelessWidget {
  final ShopCategory category;
  const SuggestionEntries(this.category);
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(
      builder: (context, backend, child) {
        switch (backend.getStatus()) {
          case DataBackendStatus.AVAILABLE:
            return Container(
                key: Key('suggested_categories'),
                child: Center(
                    child: ListView(
                  children: backend
                      .getRankedCreditCardsSync(this.category)
                      .map((CreditCard card) {
                    return BasicCreditCard(card, Colors.teal, false,
                        targetCategory: this.category);
                  }).toList(),
                )));
          case DataBackendStatus.ERROR:
            return EntriesError();
          case DataBackendStatus.OUTDATED:
            return EntriesOutdated();
          case DataBackendStatus.LOADING:
            return FetchingEntries();
          default:
            return UnknownError();
        }
      },
    );
  }
}

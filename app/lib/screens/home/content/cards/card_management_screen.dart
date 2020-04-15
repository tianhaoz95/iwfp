import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/cards/cards.dart';
import 'package:iwfpapp/screens/home/content/cards/cards_outdated.dart';
import 'package:iwfpapp/screens/home/content/cards/fetching_cards.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';
import 'package:provider/provider.dart';

/// This screen shows all the credit cards in user wallet
///
/// {@category Screens}
class ManageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(builder: (context, backend, child) {
      switch (backend.getStatus()) {
        case DataBackendStatus.AVAILABLE:
          return PreferredWidthContent(
            child: CardListCardScreen(
              cards: backend.getCreditCards(),
            ),
          );
        case DataBackendStatus.LOADING:
          return FetchingCards();
        case DataBackendStatus.OUTDATED:
          return CardsOutdated();
        case DataBackendStatus.ERROR:
          return Text('error');
        default:
          return UnknownError();
      }
    });
  }
}

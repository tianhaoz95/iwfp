import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/remove_card/card_removed.dart';
import 'package:iwfpapp/screens/remove_card/remove_card_error.dart';
import 'package:iwfpapp/screens/remove_card/remove_card_pending.dart';
import 'package:iwfpapp/screens/remove_card/removing_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:provider/provider.dart';

class RemoveCardContent extends StatelessWidget {
  final CreditCard card;
  final bool autoNav;
  const RemoveCardContent({@required this.card, this.autoNav = true});
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(
      builder: (BuildContext context, DataBackend backend, Widget child) {
        switch (backend.getStatus()) {
          case DataBackendStatus.AVAILABLE:
            return RemoveCardPending(card: this.card);
          case DataBackendStatus.LOADING:
            return RemovingCard();
          case DataBackendStatus.ERROR:
            return RemoveCardError();
          case DataBackendStatus.OUTDATED:
            return CardRemoved(
              autoNav: this.autoNav,
            );
          default:
            return UnknownError();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/edit_card/card_edited.dart';
import 'package:iwfpapp/screens/edit_card/edit_card_pending.dart';
import 'package:iwfpapp/screens/edit_card/editing_card.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:provider/provider.dart';

class EditCardContent extends StatelessWidget {
  final CreditCard card;
  const EditCardContent({@required this.card});
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(
      builder: (BuildContext context, DataBackend backend, Widget child) {
        switch (backend.getStatus()) {
          case DataBackendStatus.AVAILABLE:
            return EditCardPending(
              cardId: this.card.id,
            );
          case DataBackendStatus.LOADING:
            return EditingCard();
          case DataBackendStatus.ERROR:
            return EditCardContent(
              card: this.card,
            );
          case DataBackendStatus.OUTDATED:
            return CardEdited();
          default:
            return UnknownError();
        }
      },
    );
  }
}

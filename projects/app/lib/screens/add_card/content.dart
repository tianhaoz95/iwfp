import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_card/add_card_error.dart';
import 'package:iwfpapp/screens/add_card/add_card_pending/add_card_pending.dart';
import 'package:iwfpapp/screens/add_card/card_added.dart';
import 'package:iwfpapp/screens/add_card/loading.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:provider/provider.dart';

class AddCardScreenContent extends StatelessWidget {
  final bool autoNav;

  const AddCardScreenContent({Key key, this.autoNav = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(
      builder: (BuildContext context, DataBackend backend, Widget child) {
        switch (backend.getStatus()) {
          case DataBackendStatus.AVAILABLE:
            return AddCardScreenAddCardPendingContent();
          case DataBackendStatus.LOADING:
            return AddCardScreenLoadingContent();
          case DataBackendStatus.ERROR:
            return AddCardScreenErrorContent();
          case DataBackendStatus.OUTDATED:
            return AddCardScreenCardAddedContent(
              autoNav: this.autoNav,
            );
          default:
            return UnknownError();
        }
      },
    );
  }
}

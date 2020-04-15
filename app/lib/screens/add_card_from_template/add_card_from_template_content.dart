import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_card_from_template/add_card_from_template_error.dart';
import 'package:iwfpapp/screens/add_card_from_template/add_card_from_template_pending.dart';
import 'package:iwfpapp/screens/add_card_from_template/adding_card_from_template.dart';
import 'package:iwfpapp/screens/add_card_from_template/card_added_from_template.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:provider/provider.dart';

class AddCardFromTemplateContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(
      builder: (BuildContext context, DataBackend backend, Widget child) {
        switch (backend.getStatus()) {
          case DataBackendStatus.AVAILABLE:
            return AddCardFromTemplatePending();
          case DataBackendStatus.ERROR:
            return AddCardFromTemplateError();
          case DataBackendStatus.LOADING:
            return AddingCardFromTemplate();
          case DataBackendStatus.OUTDATED:
            return CardAddedFromTemplate();
          default:
            return UnknownError();
        }
      },
    );
  }
}

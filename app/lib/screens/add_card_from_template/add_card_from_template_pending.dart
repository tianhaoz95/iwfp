import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/credit_cards/template.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class AddCardFromTemplatePending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: Provider.of<DataBackend>(context, listen: false)
            .getCreditCardTemplates()
            .map((CreditCard cardTemplate) {
          return ListViewItem(
              child: TemplateCreditCard(
            card: cardTemplate,
            color: Colors.cyan,
            onPressedAddTemplate: () {
              Provider.of<DataBackend>(context, listen: false)
                  .initCreditCardWithTemplate(
                      CreditCardAdditionRequest(cardTemplate));
            },
          ));
        }).toList(),
      ),
    );
  }
}

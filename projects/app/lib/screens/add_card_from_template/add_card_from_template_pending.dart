import 'package:flutter/material.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/utilities/interface/creators.dart';
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
                  .initCreditCardWithTemplate(createCreditCardCreationRequest(
                cardData: cardTemplate,
              ));
            },
          ));
        }).toList(),
      ),
    );
  }
}

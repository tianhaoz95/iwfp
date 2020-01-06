import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/widgets/credit_cards/basic.dart';

typedef void OnPressedAddTemplate();

class TemplateCreditCard extends StatelessWidget {
  final CreditCard card;
  final MaterialColor color;
  final OnPressedAddTemplate onPressedAddTemplate;
  const TemplateCreditCard({
    @required this.card,
    @required this.color,
    @required this.onPressedAddTemplate,
  });
  Widget renderTemplateActions(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          onPressedAddTemplate();
        },
        child: Text('Add Template'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasicCreditCard(
      card,
      color,
      false,
      actions: renderTemplateActions(context),
    );
  }
}

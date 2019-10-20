import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/credit_card.dart';

class BasicCreditCard extends StatelessWidget {
  final CreditCard cardMetaData;
  final MaterialColor color;
  const BasicCreditCard(this.cardMetaData, this.color);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: color[100],
        child: Card(
            color: color,
            child: Row(
              children: <Widget>[
                SizedBox(height: 45.0, width: 25.0),
                Text(cardMetaData.name, style: TextStyle(color: Colors.white)),
              ],
            )));
  }
}

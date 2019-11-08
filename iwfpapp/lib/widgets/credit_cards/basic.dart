import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/cashback_promo.dart';

// TODO(tianhaoz95): this widget should know how to navigate to
// edit and remove ui for information/confirmation.
class BasicCreditCard extends StatelessWidget {
  final CreditCard cardMetaData;
  final MaterialColor color;
  const BasicCreditCard(this.cardMetaData, this.color);
  // TODO(tianhaoz95): add a variable indicating if can be edited
  @override
  Widget build(BuildContext context) {
    return Material(
        color: color[100],
        child: Card(
            color: color,
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(height: 45.0, width: 25.0),
                  Text(cardMetaData.name,
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              Container(
                height: 45.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: cardMetaData.promos.map((CashbackPromo promo) {
                    return Chip(
                        backgroundColor: color[600],
                        label: Text(
                            promo.name + '@' + promo.rate.toString() + '%',
                            style: TextStyle(color: Colors.white)));
                  }).toList(),
                ),
              )
              // TODO(tianhaoz95): add edit and remove buttons
            ])));
  }
}

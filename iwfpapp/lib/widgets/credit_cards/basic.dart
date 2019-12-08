import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/cashback_promo.dart';

class BasicCreditCard extends StatelessWidget {
  final CreditCard cardMetaData;
  final MaterialColor color;
  final bool edit;
  final Widget actions;
  const BasicCreditCard(this.cardMetaData, this.color, this.edit,
      {this.actions});
  List<Widget> getCardContent(BuildContext context) {
    String cardName = 'Unknown';
    if (cardMetaData.name != null) {
      cardName = cardMetaData.name;
    }
    List<Widget> content = <Widget>[
      Row(
        children: <Widget>[
          SizedBox(height: 45.0, width: 25.0),
          Text(cardName, style: TextStyle(color: Colors.white)),
        ],
      ),
      Container(
        height: 45.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: cardMetaData.promos.map((CashbackPromo promo) {
            String promoName = 'Unknown';
            if (promo.name != null) {
              promoName = promo.category.name;
            }
            int promoRate = -1;
            if (promo.rate != null) {
              promoRate = promo.rate;
            }
            return Chip(
                backgroundColor: color[600],
                label: Text(promoName + '@' + promoRate.toString() + '%',
                    style: TextStyle(color: Colors.white)));
          }).toList(),
        ),
      ),
    ];
    Widget editContent = getEditContent(context);
    if (editContent != null) {
      content.add(editContent);
    }
    if (actions != null) {
      content.add(actions);
    }
    return content;
  }

  Widget getEditContent(BuildContext context) {
    if (edit == true) {
      return Row(
        children: <Widget>[
          Material(
            color: color,
            child: FlatButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/edit_card',
                    arguments: cardMetaData);
              },
              child: Text('Edit', style: TextStyle(color: Colors.white)),
            ),
          ),
          Material(
            color: color,
            child: FlatButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/remove_card',
                    arguments: cardMetaData);
              },
              child: Text('Remove', style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: color[100],
        child: Card(
            color: color, child: Column(children: getCardContent(context))));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/cashback_promo.dart';

class BasicCreditCard extends StatelessWidget {
  final CreditCard cardMetaData;
  final MaterialColor color;
  final bool edit;
  const BasicCreditCard(this.cardMetaData, this.color, this.edit);
  List<Widget> getCardContent(BuildContext context) {
    List<Widget> content = <Widget>[
      Row(
        children: <Widget>[
          SizedBox(height: 45.0, width: 25.0),
          Text(cardMetaData.name, style: TextStyle(color: Colors.white)),
        ],
      ),
      Container(
        height: 45.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: cardMetaData.promos.map((CashbackPromo promo) {
            return Chip(
                backgroundColor: color[600],
                label: Text(promo.name + '@' + promo.rate.toString() + '%',
                    style: TextStyle(color: Colors.white)));
          }).toList(),
        ),
      ),
    ];
    Widget editContent = getEditContent(context);
    if (editContent != null) {
      content.add(editContent);
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
                Navigator.pushNamed(context, '/edit_card');
              },
              child: Text('Edit', style: TextStyle(color: Colors.white)),
            ),
          ),
          Material(
            color: color,
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/remove_card');
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
        child: Card(color: color, child: Column(children: getCardContent(context))));
  }
}

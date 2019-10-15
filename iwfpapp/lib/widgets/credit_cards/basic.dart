import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/credit_card.dart';

class BasicCreditCard extends StatelessWidget {
  final CreditCard cardMetaData;
  const BasicCreditCard(this.cardMetaData);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.cyan[100],
      child: Card(
        color: Colors.cyan,
        child: Row(
            children: <Widget>[
              SizedBox(height: 45.0, width: 25.0),
              Text(cardMetaData.name, style: TextStyle(color: Colors.white)),
              /// todo(tianhaoz95): enable this when there is a need
              /// to edit the cards.
              /*
              SizedBox(height: 45.0, width: 25.0),
              FlatButton(
                onPressed: () {},
                child: Text('edit', style: TextStyle(color: Colors.white)),
              ),
              */
            ],
          )
        )
    );
  }
}
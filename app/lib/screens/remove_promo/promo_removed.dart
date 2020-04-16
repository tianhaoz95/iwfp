import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';

class PromoRemoved extends StatelessWidget {
  final RemovePromoMeta removePromoMeta;
  const PromoRemoved({@required this.removePromoMeta});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Material(
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Promotion removed',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              child: Text(
                'Back to editing card',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              onPressed: () {
                CreditCard modifiedCard = removePromoMeta.card;
                modifiedCard.removePromo(removePromoMeta.promo);
                Navigator.pushReplacementNamed(context, '/edit_card',
                    arguments: modifiedCard);
              },
            ),
          ),
        ],
      ),
    );
  }
}

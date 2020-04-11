import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';

class PromoEntry extends StatelessWidget {
  final CashbackPromo promo;
  final CreditCard card;
  const PromoEntry(this.promo, this.card);
  @override
  Widget build(BuildContext context) {
    double maxContainerWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
      width: maxContainerWidth,
      child: Material(
        child: Card(
            child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Text('${promo.name} (${promo.id})'),
                    Text(
                        '${promo.type} ${promo.repeat} ${promo.start}~${promo.end}'),
                    Text(
                        '@ ${promo.rate.toString()}% for ${promo.category.name} (${promo.category.id})'),
                    RaisedButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/remove_promo',
                            arguments: RemovePromoMeta(card, promo));
                      },
                      child:
                          Text('Remove', style: TextStyle(color: Colors.white)),
                    )
                  ],
                )))),
      ),
    );
  }
}

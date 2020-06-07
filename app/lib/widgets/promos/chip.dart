import 'package:flutter/material.dart';
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/utilities/validators/card_expiration_validator.dart';

class PromotionChip extends StatelessWidget {
  final Promotion promo;
  const PromotionChip(this.promo);
  @override
  Widget build(BuildContext context) {
    String promoName = 'Unknown';
    if (promo.displayName != null) {
      promoName = promo.category.displayName;
    }
    double promoRate = 0.0;
    if (promo.rate != null) {
      promoRate = promo.rate;
    }
    Color chipColor = Colors.grey;
    if (isInValidTimeRange(promo)) {
      chipColor = Colors.green;
    }
    return Container(
        padding: EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
        child: Chip(
            backgroundColor: chipColor,
            label: Text(promoName + '@' + promoRate.toString() + '%',
                style: TextStyle(color: Colors.white))));
  }
}

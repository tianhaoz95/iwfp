import 'dart:math';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/interfaces/shopping_category.pbserver.dart';
import 'package:iwfpapp/services/utilities/validators/card_expiration_validator.dart';

double getMaxRate(CreditCard card, ShoppingCategory category) {
  double maxRate = 0.0;
  for (Promotion promo in card.promotions) {
    if (isInValidTimeRange(promo)) {
      if (promo.category.id == category.id) {
        maxRate = max(maxRate, promo.rate);
      } else {
        if (promo.type == 'universal') {
          maxRate = max(maxRate, promo.rate);
        }
      }
    }
  }
  return maxRate;
}

void rankCards(List<CreditCard> cards, ShoppingCategory category) {
  cards.sort((CreditCard cardLhs, CreditCard cardRhs) {
    double maxLhsRate = getMaxRate(cardLhs, category);
    double maxRhsRate = getMaxRate(cardRhs, category);
    return maxRhsRate.compareTo(maxLhsRate);
  });
}

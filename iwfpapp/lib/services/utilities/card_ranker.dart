import 'dart:math';
import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/utilities/validators/card_expiration_validator.dart';

int getMaxRate(CreditCard card, ShopCategory category) {
  int maxRate = 0;
  for (CashbackPromo promo in card.promos) {
    if (isInValidTimeRange(promo)) {
      if (promo.id == category.id) {
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

void rankCards(List<CreditCard> cards, ShopCategory category) {
  cards.sort((CreditCard cardLhs, CreditCard cardRhs) {
    int maxLhsRate = getMaxRate(cardLhs, category);
    int maxRhsRate = getMaxRate(cardRhs, category);
    return maxRhsRate.compareTo(maxLhsRate);
  });
}
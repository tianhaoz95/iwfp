import 'dart:math';

import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/shop_category.dart';

bool isInValidTimeRange(CashbackPromo promo) {
  /**
   * @todo Add dart datetime to validate expiration
   * @body The app should know what the current date
   * is and use it to match the promo duration
   */
  return true;
}

int getMaxRate(CreditCard card, ShopCategory category) {
  int maxRate = 0;
  for (CashbackPromo promo in card.promos) {
    if (isInValidTimeRange(promo)) {
      if (promo.name == category.name) {
        maxRate = max(maxRate, promo.rate);
      } else {
        if (promo.type == 'generic') {
          maxRate = max(maxRate, promo.rate);
        }
      }
    }
  }
  return maxRate;
}

void cardRanker(List<CreditCard> cards, ShopCategory category) {
  cards.sort((CreditCard cardLhs, CreditCard cardRhs) {
    int maxLhsRate = getMaxRate(cardLhs, category);
    int maxRhsRate = getMaxRate(cardRhs, category);
    return maxRhsRate.compareTo(maxLhsRate);
  });
}

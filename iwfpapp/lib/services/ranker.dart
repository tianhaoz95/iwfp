import 'dart:math';

import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/fetcher.dart';
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

Future<List<CreditCard>> getRankedCards(
    String uid, ShopCategory category) async {
  List<CreditCard> cards = await fetchAllCreditCards(uid);
  rankCards(cards, category);
  return cards;
}

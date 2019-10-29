import 'dart:math';

import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/fetcher.dart';
import 'package:iwfpapp/services/shop_category.dart';

bool isInValidTimeRange(CashbackPromo promo) {
  bool valid = false;
  switch(promo.repeat) {
    case 'const': {
      valid = true;
    }
    break;

    case 'annual': {
      DateTime currentTime = new DateTime.now();
      int currentYear = currentTime.year;
      int startMonth = int.parse(promo.start.split('/')[0]);
      int startDay = int.parse(promo.start.split('/')[1]);
      int endMonth = int.parse(promo.end.split('/')[0]);
      int endDay = int.parse(promo.end.split('/')[1]);
      DateTime startTime = new DateTime.utc(currentYear, startMonth, startDay);
      DateTime endTime = new DateTime.utc(currentYear, endMonth, endDay);
      if (currentTime.isAfter(startTime) && currentTime.isBefore(endTime)) {
        valid = true;
      } else {
        valid = false;
      }
    }
    break;

    default: {
      valid = false;
    }
    break;
  }
  return valid;
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

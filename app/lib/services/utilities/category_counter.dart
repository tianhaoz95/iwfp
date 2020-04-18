import 'dart:math';

import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';

List<ShopCategory> getUniqueShoppingCategories(List<CreditCard> cards) {
  Map<String, bool> promoIdDict = {};
  List<ShopCategory> uniqueCategories = [];
  for (CreditCard card in cards) {
    for (CashbackPromo promo in card.promos) {
      if (!promoIdDict.containsKey(promo.id)) {
        promoIdDict[promo.id] = true;
        uniqueCategories.add(promo.category);
      }
    }
  }
  return uniqueCategories;
}

ShopCategory getRandomShoppingCategories(List<CreditCard> cards) {
  List<ShopCategory> categories = getUniqueShoppingCategories(cards);
  Random randomGenerator = Random();
  return categories[randomGenerator.nextInt(categories.length)];
}

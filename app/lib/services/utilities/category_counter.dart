import 'dart:math';

import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/interfaces/shopping_category.pbserver.dart';

List<ShoppingCategory> getUniqueShoppingCategories(List<CreditCard> cards) {
  Map<String, bool> promoIdDict = {};
  List<ShoppingCategory> uniqueCategories = [];
  for (CreditCard card in cards) {
    for (Promotion promo in card.promos) {
      if (!promoIdDict.containsKey(promo.id)) {
        promoIdDict[promo.id] = true;
        uniqueCategories.add(promo.category);
      }
    }
  }
  return uniqueCategories;
}

ShoppingCategory getRandomShoppingCategories(List<CreditCard> cards) {
  List<ShoppingCategory> categories = getUniqueShoppingCategories(cards);
  Random randomGenerator = Random();
  return categories[randomGenerator.nextInt(categories.length)];
}

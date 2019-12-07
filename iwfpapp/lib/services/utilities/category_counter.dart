import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/shop_category.dart';

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

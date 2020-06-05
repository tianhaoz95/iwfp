import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/interfaces/shopping_category.pb.dart';

ShoppingCategory createShoppingCategory(String displayName, String id) {
  ShoppingCategory shoppingCategory = ShoppingCategory.create();
  shoppingCategory.id = id;
  shoppingCategory.displayName = displayName;
  return shoppingCategory;
}

Promotion createPromotion(
    String displayName,
    String id,
    String type,
    String startDate,
    String endDate,
    String repeatPattern,
    double rate,
    ShoppingCategory shoppingCategory) {
  Promotion promo = Promotion.create();
  promo.id = id;
  promo.displayName = displayName;
  promo.startDate = startDate;
  promo.endDate = endDate;
  promo.type = type;
  promo.repeatPattern = repeatPattern;
  promo.rate = rate;
  promo.category = shoppingCategory;
  return promo;
}

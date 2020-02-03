import 'package:edit_distance/edit_distance.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/config/typedefs/shopping_context.dart';

List<ShopCategory> rankShopCategories(
    List<ShopCategory> categories, ShoppingContext context) {
  List<ShopCategory> sortedCategories = categories;
  String query = context.query;
  Levenshtein editDistance = Levenshtein();
  sortedCategories.sort((ShopCategory lhs, ShopCategory rhs) {
    double lhsDist = editDistance.normalizedDistance(lhs.name, query);
    double rhsDist = editDistance.normalizedDistance(rhs.name, query);
    return lhsDist.compareTo(rhsDist);
  });
  return sortedCategories;
}

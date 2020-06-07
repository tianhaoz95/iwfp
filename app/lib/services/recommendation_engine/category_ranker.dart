import 'package:edit_distance/edit_distance.dart';
import 'package:iwfpapp/services/config/typedefs/shopping_context.dart';
import 'package:iwfpapp/services/interfaces/shopping_category.pb.dart';

List<ShoppingCategory> rankShopCategories(
    List<ShoppingCategory> categories, ShoppingContext context) {
  List<ShoppingCategory> sortedCategories = categories;
  String query = context.query;
  Levenshtein editDistance = Levenshtein();
  sortedCategories.sort((ShoppingCategory lhs, ShoppingCategory rhs) {
    double lhsDist = editDistance.normalizedDistance(lhs.displayName, query);
    double rhsDist = editDistance.normalizedDistance(rhs.displayName, query);
    return lhsDist.compareTo(rhsDist);
  });
  return sortedCategories;
}

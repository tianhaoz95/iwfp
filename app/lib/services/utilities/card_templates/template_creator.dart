import 'package:iwfpapp/services/interfaces/shopping_category.pb.dart';

ShoppingCategory createShoppingCategory(String displayName, String id) {
  ShoppingCategory shoppingCategory = ShoppingCategory.create();
  shoppingCategory.id = id;
  shoppingCategory.displayName = displayName;
  return shoppingCategory;
}

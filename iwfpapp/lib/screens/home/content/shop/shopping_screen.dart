import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/shop/categories.dart';
import 'package:iwfpapp/screens/home/content/shop/empty.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

class ShopNow extends StatelessWidget {
  final List<ShopCategory> categories;

  const ShopNow(this.categories);

  @override
  Widget build(BuildContext context) {
    if (this.categories.isEmpty) {
      return PreferredWidthContent(child: EmptyWalletShoppingScreen());
    } else {
      return PreferredWidthContent(
          child: CategoriesShoppingScreen(categories: this.categories));
    }
  }
}

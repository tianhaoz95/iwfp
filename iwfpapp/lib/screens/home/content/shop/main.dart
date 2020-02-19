import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/shop/categories.dart';
import 'package:iwfpapp/screens/home/content/shop/empty.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';

class ShopNow extends StatelessWidget {
  final List<ShopCategory> categories;

  const ShopNow(this.categories);

  @override
  Widget build(BuildContext context) {
    if (this.categories.isEmpty) {
      return EmptyWalletShoppingScreen();
    } else {
      double contentWidth = min(MediaQuery.of(context).size.width, 600);
      return Center(
          child: Container(
              width: contentWidth,
              child: CategoriesShoppingScreen(categories: this.categories)));
    }
  }
}

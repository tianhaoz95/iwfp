import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/shop/empty.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/widgets/category/basic.dart';

class CategoriesShoppingScreen extends StatelessWidget {
  final List<ShopCategory> categories;
  const CategoriesShoppingScreen({this.categories});
  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return EmptyWalletShoppingScreen();
    }
    return Container(
        key: Key('suggested_categories'),
        child: Container(
            child: ListView(
          children: this.categories.map((ShopCategory category) {
            return BasicCategory(category);
          }).toList(),
        )));
  }
}

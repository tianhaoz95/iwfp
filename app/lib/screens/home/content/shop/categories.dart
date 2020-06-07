import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/shop/empty.dart';
import 'package:iwfpapp/services/interfaces/shopping_category.pb.dart';
import 'package:iwfpapp/widgets/category/basic.dart';

class CategoriesShoppingScreen extends StatelessWidget {
  final List<ShoppingCategory> categories;
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
          children: this.categories.map((ShoppingCategory category) {
            return BasicCategory(category);
          }).toList(),
        )));
  }
}

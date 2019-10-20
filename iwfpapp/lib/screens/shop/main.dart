import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/category/basic.dart';
import 'package:iwfpapp/services/shop_category.dart';

class ShopNow extends StatefulWidget {
  const ShopNow({Key key}) : super(key: key);

  @override
  _ShopNow createState() {
    return _ShopNow();
  }
}

class _ShopNow extends State<ShopNow> {
  List<ShopCategory> suggestions = [
    ShopCategory('Samsung Pay'),
    ShopCategory('Restaurants'),
    ShopCategory('Coffee Shop'),
    ShopCategory('Amazon.com'),
    ShopCategory('Walmart'),
    ShopCategory('Macy'),
    ShopCategory('Nike'),
    ShopCategory('Vans'),
    ShopCategory('Hotels'),
    ShopCategory('Apple'),
    ShopCategory('Microsoft'),
    ShopCategory('Google Pay'),
    ShopCategory('Chase Pay'),
    ShopCategory('Gas Station'),
    ShopCategory('Traveling'),
    ShopCategory('Best Buy'),
    ShopCategory('Safeway'),
    ShopCategory('CVS'),
    ShopCategory('Great Mall'),
    ShopCategory('Outlets'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key('suggested_categories'),
        child: Center(
            child: ListView(
          children: suggestions.map((ShopCategory category) {
            return BasicCategory(category);
          }).toList(),
        )));
  }
}

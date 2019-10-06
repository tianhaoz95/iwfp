import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/inputs/shop_category_filter_input.dart';
import 'suggestions.dart';

class ShopNow extends StatefulWidget {
  const ShopNow({Key key}) : super(key: key);

  @override
  _ShopNow createState() {
    return _ShopNow();
  }
}

class _ShopNow extends State<ShopNow> {
  List<ShopCategory> suggestions = [
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
    ShopCategory('test'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ShopCategoryFilterInput(),
            Suggestions(suggestions),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /**
             * @todo Add searchable shopping categories
             * @body it will be much easier to find during
             * a quick payment situation if the categories
             * are searchable. It is not added for now due
             * to some trick bug of Flutter where it refuse
             * to pass the unit test no matter what. Once
             * figured out the problem, use the widget
             * defined in: 
             * package:iwfpapp/widgets/inputs/shop_category_filter_input.dart
             * here to get the UI. The logic is not implemented
             * at all due to the UI failure.
             */
            Suggestions(suggestions),
          ],
        ));
  }
}

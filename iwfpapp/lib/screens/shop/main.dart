import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/category/basic.dart';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/fetcher.dart';

class ShopNow extends StatefulWidget {
  const ShopNow({Key key}) : super(key: key);

  @override
  _ShopNow createState() {
    return _ShopNow();
  }
}

class _ShopNow extends State<ShopNow> {
  List<ShopCategory> suggestions = [
    ShopCategory('Samsung Pay', 'samsung_pay'),
    ShopCategory('Restaurants', 'restaurants'),
    ShopCategory('Coffee Shop', 'coffee_shop'),
    ShopCategory('Amazon.com', 'amazon'),
    ShopCategory('Walmart', 'walmart'),
    ShopCategory('Macy', 'macy'),
    ShopCategory('Nike', 'nike'),
    ShopCategory('Vans', 'vans'),
    ShopCategory('Hotels', 'hotel'),
    ShopCategory('Apple', 'apple'),
    ShopCategory('Microsoft', 'microsoft'),
    ShopCategory('Google Pay', 'google_pay'),
    ShopCategory('Chase Pay', 'chase_pay'),
    ShopCategory('Gas Station', 'gas_station'),
    ShopCategory('Traveling', 'traveling'),
    ShopCategory('Best Buy', 'best_buy'),
    ShopCategory('Safeway', 'safeway'),
    ShopCategory('CVS', 'cvs'),
    ShopCategory('Great Mall', 'great_mall'),
    ShopCategory('Outlets', 'outlets'),
  ];
  Future<List<ShopCategory>> categories;

  @override
  void initState() {
    super.initState();
    categories = fetchAllShopCategories('tianhaoz95');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ShopCategory>>(
      future: categories,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            key: Key('suggested_categories'),
            child: Center(
                child: ListView(
              children: suggestions.map((ShopCategory category) {
                return BasicCategory(category);
              }).toList(),
            )));
        } else if (snapshot.hasError) {
          return Text('error');
        }
        return Text('loading...');
      },
    );
  }
}

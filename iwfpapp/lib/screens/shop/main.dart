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
              children: snapshot.data.map((ShopCategory category) {
                return BasicCategory(category);
              }).toList(),
            )));
        } else if (snapshot.hasError) {
          return Center(
            child: Text('error'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

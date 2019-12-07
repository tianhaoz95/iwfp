import 'package:flutter/material.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/widgets/category/basic.dart';
import 'package:iwfpapp/services/shop_category.dart';

class ShopNow extends StatefulWidget {
  final DataStore dataStore;
  const ShopNow(this.dataStore, {Key key}) : super(key: key);
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
    categories = widget.dataStore.getShopCategories();
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
            child: Text('Error: ' + snapshot.error.toString()),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

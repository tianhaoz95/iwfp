import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';

class BasicCategory extends StatelessWidget {
  final ShopCategory categoryMetaData;
  const BasicCategory(this.categoryMetaData);
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 45.0, width: 25.0),
                Text(categoryMetaData.name),
                SizedBox(height: 45.0, width: 25.0),
                FlatButton(
                  child: Text('Select'),
                  key: Key(categoryMetaData.id + '_select_btn'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/suggestion',
                        arguments: categoryMetaData);
                  },
                ),
              ],
            )));
  }
}

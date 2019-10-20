import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/shop_category.dart';

class BasicCategory extends StatelessWidget {
  final ShopCategory categoryMetaData;
  const BasicCategory(this.categoryMetaData);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.teal[100],
        child: Card(
            color: Colors.teal,
            child: Row(
              children: <Widget>[
                SizedBox(height: 45.0, width: 25.0),
                Text(categoryMetaData.name,
                    style: TextStyle(color: Colors.white)),
                SizedBox(height: 45.0, width: 25.0),
                FlatButton(
                  child: Text('Select', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/suggestion');
                  },
                ),
              ],
            )));
  }
}

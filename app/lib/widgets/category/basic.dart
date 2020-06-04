import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/interfaces/shopping_category.pb.dart';

class BasicCategory extends StatelessWidget {
  final ShoppingCategory categoryMetaData;
  const BasicCategory(this.categoryMetaData);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
            child: Card(
                child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/suggestion',
                          arguments: categoryMetaData);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            width: 200.0,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(categoryMetaData.displayName),
                            )),
                        Container(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.shopping_cart),
                          key: Key(categoryMetaData.id + '_select_btn'),
                        )),
                      ],
                    )))));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopCategoryFilterInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
            key: Key('shop_category_filter_input_text_field'),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Filter By Shop Category',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)))));
  }
}

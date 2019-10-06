import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopCategoryFilterInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: 'Filter By Shop Category',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
  }
}

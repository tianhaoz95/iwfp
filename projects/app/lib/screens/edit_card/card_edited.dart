import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class CardEdited extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        ListViewItem(
          child: Center(
            child: Text('Card Edited'),
          ),
        )
      ],
    ));
  }
}

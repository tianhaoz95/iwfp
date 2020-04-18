import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class AddCardScreenErrorContent extends StatelessWidget {
  const AddCardScreenErrorContent();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListViewItem(
            child: Center(
              child: Text('Error Adding Card'),
            ),
          )
        ],
      ),
    );
  }
}

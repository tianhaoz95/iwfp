import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class EditCardError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListViewItem(
            child: Center(
              child: Text('Error Editing Card'),
            ),
          )
        ],
      ),
    );
  }
}

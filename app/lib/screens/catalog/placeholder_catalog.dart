import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class PlaceholderCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListViewItem(
            child: Center(
              child: Text('Placeholder'),
            ),
          ),
          Divider(),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Pending'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/placeholder');
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

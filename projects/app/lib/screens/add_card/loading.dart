import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class AddCardScreenLoadingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          LinearProgressIndicator(
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 25.0,
          ),
          ListViewItem(
            child: Center(
              child: Text('Adding credit card to your wallet...'),
            ),
          ),
          ListViewItem(
              child: Center(
            child: Text('Please be patient...'),
          )),
          ListViewItem(
            child: Center(
              child: Text('This should take a few seconds...'),
            ),
          ),
        ],
      ),
    );
  }
}

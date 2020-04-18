import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class PlaceholderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Under Construction'),
        key: Key('placeholder_title'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListViewItem(
                child: Image.asset(
              'assets/coming_soon.png',
              key: Key('coming_soon_img'),
            )),
            ListViewItem(
              child: Center(
                child: Text('The feature is under construction.'),
              ),
            ),
            ListViewItem(
              child: Center(
                child: Text('Please check back later :)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final Widget child;

  const ListViewItem({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: this.child,
    );
  }
  
}
import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

class ListViewItem extends StatelessWidget {
  final Widget child;

  const ListViewItem({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredWidthContent(
      child: Container(
        padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        child: this.child,
      ),
    );
  }
}

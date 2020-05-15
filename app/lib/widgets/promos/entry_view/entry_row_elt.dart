import 'package:flutter/material.dart';

class PromoEntryRowElement extends StatelessWidget {
  final String text;

  const PromoEntryRowElement({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 4.0),
      child: Text(this.text),
    );
  }
}

import 'package:flutter/material.dart';

typedef void OnDeleteTappedHandler();
typedef void OnEditTappedHandler();

class PromoEntryEditActions extends StatelessWidget {
  final OnDeleteTappedHandler onDeleteTappedHandler;
  final OnEditTappedHandler onEditTappedHandler;

  const PromoEntryEditActions(
      {Key key,
      @required this.onDeleteTappedHandler,
      @required this.onEditTappedHandler})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            color: Colors.green,
            icon: Icon(Icons.edit),
            onPressed: this.onEditTappedHandler),
        IconButton(
            color: Colors.redAccent,
            icon: Icon(Icons.delete),
            onPressed: this.onDeleteTappedHandler),
      ],
    ));
  }
}

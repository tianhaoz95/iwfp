import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef onPressedCallbackFunc = void Function();

class SubmitAddCardButton extends StatelessWidget {
  final onPressedCallbackFunc onPressedCallback;
  const SubmitAddCardButton({this.onPressedCallback});
  @override
  Widget build(BuildContext context) {
    return Material(
        key: Key('add_card_btn'),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.cyan,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () async {
              onPressedCallback();
            },
            child: Text('Add credit card',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white))));
  }
}

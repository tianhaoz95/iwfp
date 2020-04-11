import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef onPressedCallbackFunc = void Function();

class GoToHomeButton extends StatelessWidget {
  final onPressedCallbackFunc onPressedCallback;
  const GoToHomeButton({this.onPressedCallback});
  @override
  Widget build(BuildContext context) {
    return Material(
        key: Key('go_to_home_btn'),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).primaryColor,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              onPressedCallback();
            },
            child: Text('Continue to Home',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white))));
  }
}

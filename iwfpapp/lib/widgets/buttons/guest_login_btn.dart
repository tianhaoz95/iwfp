import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef onPressedCallbackFunc = void Function();

class GuestLoginButton extends StatelessWidget {
  final onPressedCallbackFunc onPressedCallback;
  const GuestLoginButton({this.onPressedCallback});
  @override
  Widget build(BuildContext context) {
    return Material(
        key: Key('guest_login_btn'),
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.blue,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              onPressedCallback();
            },
            child: Text('Continue as guest',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white))));
  }
}

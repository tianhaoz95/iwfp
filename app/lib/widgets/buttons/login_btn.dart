import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef onPressedCallbackFunc = void Function();

class LoginButton extends StatelessWidget {
  final onPressedCallbackFunc onPressedCallback;
  const LoginButton({this.onPressedCallback});
  @override
  Widget build(BuildContext context) {
    return Material(
        key: Key('email_login_btn'),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.blue,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              onPressedCallback();
            },
            child: Text('Login with Email',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white))));
  }
}

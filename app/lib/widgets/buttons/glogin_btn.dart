import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef onPressedCallbackFunc = void Function();

class GLoginButton extends StatelessWidget {
  final onPressedCallbackFunc onPressedCallback;
  const GLoginButton({this.onPressedCallback});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {
        onPressedCallback();
      },
      child: Image.asset('assets/glogin_btn_icon.png'),
    );
  }
}

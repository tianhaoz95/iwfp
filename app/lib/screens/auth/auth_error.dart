import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:provider/provider.dart';

class AuthErrorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Text('Error'),
        RaisedButton(
            child: Text('Try again'),
            onPressed: () {
              Provider.of<AppAuth>(context, listen: false).clearAuthState();
            })
      ],
    ));
  }
}

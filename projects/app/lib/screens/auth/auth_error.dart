import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class AuthErrorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        ListViewItem(
          child: Center(
            child: Text('Failed to sign in :('),
          ),
        ),
        ListViewItem(
          child: Center(
            child: Text('Please check your email and password.'),
          ),
        ),
        ListViewItem(
            child: Material(
          child: RaisedButton(
              child: Text('Try again'),
              onPressed: () {
                Provider.of<AppAuth>(context, listen: false).clearAuthState();
              }),
        )),
      ],
    ));
  }
}

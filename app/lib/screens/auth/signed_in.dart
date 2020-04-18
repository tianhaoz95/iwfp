import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class AuthScreenSignedInContent extends StatelessWidget {
  const AuthScreenSignedInContent();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListViewItem(
            child: Center(
              child: Text('Welcome Back!'),
            ),
            key: Key('sign_in_welcome_back_title'),
          ),
          ListViewItem(
              child: Material(
            child: RaisedButton(
                key: Key('go_to_home_btn'),
                child: Text('Get started!'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/',
                      arguments: HomeTabId.USER_SETTINGS);
                }),
          )),
          ListViewItem(
              child: Material(
            child: RaisedButton(
                key: Key('logout_btn'),
                child: Text('Sign out'),
                onPressed: () {
                  Provider.of<AppAuth>(context, listen: false).signOut();
                }),
          )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/config/typedefs/auth_states.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class SignUpCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListViewItem(
            child: Center(
              child: Text('Sign Up'),
            ),
          ),
          Divider(),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Signed In'),
                  onPressed: () {
                    Provider.of<AppAuth>(
                      context,
                      listen: false,
                    ).authState = AuthState.SIGNED_IN;
                    Navigator.pushNamed(context, '/sign_up');
                  }),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Not Signed In'),
                  onPressed: () {
                    Provider.of<AppAuth>(
                      context,
                      listen: false,
                    ).authState = AuthState.NOT_SIGNED_IN;
                    Navigator.pushNamed(context, '/sign_up');
                  }),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Loading'),
                  onPressed: () {
                    Provider.of<AppAuth>(
                      context,
                      listen: false,
                    ).authState = AuthState.LOADING;
                    Navigator.pushNamed(context, '/sign_up');
                  }),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Error'),
                  onPressed: () {
                    Provider.of<AppAuth>(
                      context,
                      listen: false,
                    ).authState = AuthState.ERROR;
                    Navigator.pushNamed(context, '/sign_up');
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

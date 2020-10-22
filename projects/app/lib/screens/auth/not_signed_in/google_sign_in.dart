import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/app_context/base_app_context.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class GoogleSignInBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppContext>(
      builder: (BuildContext context, AppContext appContext, Widget child) {
        if (appContext.allowGoogleSignIn()) {
          return ListViewItem(
              child: Material(
            child: RaisedButton(
              color: Colors.green,
              key: Key('google_sign_in_btn'),
              child: Text(
                'Sign In with Google',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<AppAuth>(context, listen: false).signInWithGoogle();
              },
            ),
          ));
        } else {
          return Container();
        }
      },
    );
  }
}

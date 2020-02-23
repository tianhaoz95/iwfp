import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/buttons/go_to_home_btn.dart';
import 'package:iwfpapp/widgets/buttons/logout_btn.dart';

typedef Future<void> SignOutHandler();

class AuthScreenSignedInContent extends StatelessWidget {
  final SignOutHandler signOutHandler;
  const AuthScreenSignedInContent({this.signOutHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          Container(
            child: Center(
              child: Text('Welcome Back!'),
            ),
            key: Key('sign_in_welcome_back_title'),
          ),
          SizedBox(height: 25.0),
          GoToHomeButton(
            onPressedCallback: () async {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          SizedBox(height: 25.0),
          LogoutButton(
            onPressedCallback: () async {
              await this.signOutHandler();
            },
          )
        ],
      ),
    );
  }
}

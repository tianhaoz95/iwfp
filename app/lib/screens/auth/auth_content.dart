import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/auth/not_signed_in.dart';
import 'package:iwfpapp/screens/auth/signed_in.dart';
import 'package:iwfpapp/screens/auth/unknown_auth_err.dart';
import 'package:iwfpapp/services/config/typedefs/auth_states.dart';

class AuthScreenContent extends StatelessWidget {
  final AuthState authState;
  final SignOutHandler signOutHandler;
  final EmailSignInHandler emailSignInHandler;
  final ForgetPasswordHandler forgetPasswordHandler;
  final TextEditingController emailInputController;
  final TextEditingController pwdInputController;
  final bool inputEnabled;
  const AuthScreenContent(
      {this.inputEnabled,
      this.authState,
      this.signOutHandler,
      this.emailSignInHandler,
      this.forgetPasswordHandler,
      this.emailInputController,
      this.pwdInputController});
  @override
  Widget build(BuildContext context) {
    switch (authState) {
      case AuthState.SIGNED_IN:
        return AuthScreenSignedInContent(
          signOutHandler: this.signOutHandler,
        );
      case AuthState.NOT_SIGNED_IN:
        return AuthNotSignedInContent(
          enabled: this.inputEnabled,
          emailSignInHandler: this.emailSignInHandler,
          forgetPasswordHandler: this.forgetPasswordHandler,
          emailInputController: this.emailInputController,
          pwdInputController: this.pwdInputController,
        );
      default:
        return UnknownAuthErrorContent();
    }
  }
}

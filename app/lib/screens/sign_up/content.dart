import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/sign_up/error.dart';
import 'package:iwfpapp/screens/sign_up/loading.dart';
import 'package:iwfpapp/screens/sign_up/register_form.dart';
import 'package:iwfpapp/screens/sign_up/registered.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/config/typedefs/auth_states.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:provider/provider.dart';

class SignUpScreenContent extends StatelessWidget {
  const SignUpScreenContent();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuth>(
      builder: (BuildContext context, AppAuth auth, Widget child) {
        switch (auth.getAuthState()) {
          case AuthState.SIGNED_IN:
            return RegisteredSignUpScreenContent();
          case AuthState.ERROR:
            return SignUpScreenErrorContent();
          case AuthState.LOADING:
            return SignUpScreenLoadingContent();
          case AuthState.NOT_SIGNED_IN:
            return RegisterFormSignUpScreenContent();
          default:
            return UnknownError();
        }
      },
    );
  }
}

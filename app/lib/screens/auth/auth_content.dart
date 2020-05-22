import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/auth/auth_error.dart';
import 'package:iwfpapp/screens/auth/auth_loading.dart';
import 'package:iwfpapp/screens/auth/not_signed_in/not_signed_in.dart';
import 'package:iwfpapp/screens/auth/signed_in.dart';
import 'package:iwfpapp/screens/auth/unknown_auth_err.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/config/typedefs/auth_states.dart';
import 'package:provider/provider.dart';

class AuthScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuth>(builder: (context, appAuth, child) {
      switch (appAuth.getAuthState()) {
        case AuthState.SIGNED_IN:
          return AuthScreenSignedInContent();
        case AuthState.LOADING:
          return AuthLoadingContent();
        case AuthState.ERROR:
          return AuthErrorContent();
        case AuthState.NOT_SIGNED_IN:
          return AuthNotSignedInContent();
        default:
          return UnknownAuthErrorContent();
      }
    });
  }
}

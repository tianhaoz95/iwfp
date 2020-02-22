import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/auth/auth_content.dart';
import 'package:iwfpapp/screens/auth/prompt_auth_err.dart';
import 'package:iwfpapp/screens/auth/prompt_warning.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/config/typedefs/auth_states.dart';
import 'package:iwfpapp/services/config/typedefs/nav_config.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/utilities/validators/email_validator.dart';
import 'package:iwfpapp/services/utilities/validators/sign_in_validator.dart';
import 'package:iwfpapp/services/app_context/interface.dart';

class LoginScreen extends StatefulWidget {
  final AppAuth auth;
  final AppContext appContext;
  final DataBackend dataBackend;
  LoginScreen(this.auth, this.appContext, this.dataBackend);
  @override
  _LoginScreen createState() => _LoginScreen(auth);
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  final AppAuth auth;
  bool inputEnabled;
  AuthState authState;

  _LoginScreen(this.auth);

  @override
  void initState() {
    super.initState();
    this.inputEnabled = false;
    this.emailInputController = TextEditingController();
    this.pwdInputController = TextEditingController();
    getSignInStatus();
  }

  Future<void> getSignInStatus() async {
    bool signedIn = await auth.isSignedIn();
    if (signedIn) {
      await widget.dataBackend.maybeRefreshCards();
      setState(() {
        inputEnabled = true;
        authState = AuthState.SIGNED_IN;
      });
    } else {
      setState(() {
        inputEnabled = true;
        authState = AuthState.NOT_SIGNED_IN;
      });
    }
  }

  void handleForgetPassword(BuildContext context) async {
    String email = emailInputController.text;
    ValidationResponse response = isValidEmail(email);
    if (!response.valid) {
      await promptWarning(context, response.messages);
      return;
    }
    ForgotPasswordNavConfig navConfig = ForgotPasswordNavConfig(email: email);
    Navigator.pushNamed(context, '/forgot_password', arguments: navConfig);
  }

  Future<void> handleEmailSignIn(BuildContext context) async {
    String email = emailInputController.text;
    String pwd = pwdInputController.text;
    ValidationResponse signInValidationResponse = isValidSignInInfo(email, pwd);
    if (!signInValidationResponse.valid) {
      await promptWarning(context, signInValidationResponse.messages);
      return;
    }
    setState(() {
      inputEnabled = false;
    });
    await auth.handleSignInWithEmail(email, pwd);
    await getSignInStatus();
    if (this.authState == AuthState.SIGNED_IN) {
      Navigator.pushReplacementNamed(context, '/');
    } else {
      await promptAuthError(context, 'Sign in with email failed',
          'Please check your password.', 'sign_in_failed_prompt');
    }
  }

  Future<void> handleSignOut() async {
    this.setState(() {
      inputEnabled = false;
    });
    await auth.handleSignOut();
    await getSignInStatus();
    this.setState(() {
      inputEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double contentWidth = min(MediaQuery.of(context).size.width, 600);
    return Scaffold(
      appBar: AppBar(title: Text(widget.appContext.devifyString('Welcome'))),
      key: Key('login_screen'),
      body: Container(
          child: Center(
              child: Container(
                  width: contentWidth,
                  child: AuthScreenContent(
                    inputEnabled: this.inputEnabled,
                    authState: this.authState,
                    signOutHandler: this.handleSignOut,
                    emailSignInHandler: this.handleEmailSignIn,
                    forgetPasswordHandler: this.handleForgetPassword,
                    emailInputController: this.emailInputController,
                    pwdInputController: this.pwdInputController,
                  )))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/sign_up/error.dart';
import 'package:iwfpapp/screens/sign_up/loading.dart';
import 'package:iwfpapp/screens/sign_up/register_form.dart';
import 'package:iwfpapp/screens/sign_up/registered.dart';
import 'package:iwfpapp/screens/sign_up/unknown.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';

class SignUpScreenContent extends StatelessWidget {
  final SubmitScreenStatus status;
  final TextEditingController emailCtrl;
  final TextEditingController pwdCtrl;
  final TextEditingController pwdConfirmCtrl;
  final SignUpHandler signUpHandler;
  final String errMsg;
  const SignUpScreenContent(
      {this.status,
      this.emailCtrl,
      this.pwdCtrl,
      this.pwdConfirmCtrl,
      this.signUpHandler,
      this.errMsg});
  @override
  Widget build(BuildContext context) {
    switch (status) {
      case SubmitScreenStatus.PENDING:
        return RegisterFormSignUpScreenContent(
            signUpHandler: this.signUpHandler,
            emailCtrl: this.emailCtrl,
            pwdCtrl: this.pwdCtrl,
            pwdConfirmCtrl: this.pwdConfirmCtrl);
      case SubmitScreenStatus.LOADING:
        return SignUpScreenLoadingContent();
      case SubmitScreenStatus.ERROR:
        return SignUpScreenErrorContent(errMsg: this.errMsg);
      case SubmitScreenStatus.DONE:
        return RegisteredSignUpScreenContent();
      default:
        return SignUpScreenUnknownContent();
    }
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/sign_up/content.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/config/typedefs/auth_status.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/utilities/validators/register_validator.dart';

/// The sign up screen
///
/// {@category Screens}
class SignUpScreen extends StatefulWidget {
  final AppAuth auth;
  const SignUpScreen(this.auth, {Key key}) : super(key: key);
  @override
  _SignUpScreen createState() {
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State<SignUpScreen> {
  SubmitScreenStatus status = SubmitScreenStatus.PENDING;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();
  TextEditingController pwdConfirmCtrl = TextEditingController();
  String msg = 'na';

  Future<void> promptWarning(
      BuildContext context, List<String> messages) async {
    List<Widget> content = messages.map((String message) {
      return Text(message);
    }).toList();
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: content,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> handleSignUp() async {
    String email = emailCtrl.text;
    String pwd = pwdCtrl.text;
    String pwdConfirm = pwdConfirmCtrl.text;
    ValidationResponse registerValidationResponse =
        isValidRegisterInfo(email, pwd, pwdConfirm);
    if (!registerValidationResponse.valid) {
      await promptWarning(context, registerValidationResponse.messages);
      return;
    }
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    if (pwd == pwdConfirm) {
      SignUpResponse response =
          await widget.auth.handleSignUpWithEmail(email, pwd);
      switch (response.status) {
        case SignUpStatus.SUCCESS:
          setState(() {
            status = SubmitScreenStatus.DONE;
          });
          break;
        case SignUpStatus.FAIL:
          setState(() {
            status = SubmitScreenStatus.ERROR;
            msg = response.msg;
          });
          break;
        case SignUpStatus.UNKNOWN:
          setState(() {
            status = SubmitScreenStatus.ERROR;
            msg = response.msg;
          });
          break;
        default:
          setState(() {
            status = SubmitScreenStatus.UNKNOWN;
          });
      }
    } else {
      setState(() {
        status = SubmitScreenStatus.ERROR;
        msg = 'Password not matching';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double contentWidth = min(MediaQuery.of(context).size.width, 600);
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign up for iwfpapp'),
        ),
        body: Container(
            child: Center(
                child: Container(
          width: contentWidth,
          child: SignUpScreenContent(
            status: this.status,
            emailCtrl: this.emailCtrl,
            pwdCtrl: this.pwdCtrl,
            pwdConfirmCtrl: this.pwdConfirmCtrl,
            signUpHandler: this.handleSignUp,
            errMsg: this.msg,
          ),
        ))));
  }
}

import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/sign_up/content.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

/// The sign up screen
///
/// {@category Screens}
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up for iwfpapp'),
      ),
      body: SignUpScreenContent(),
    );
  }
}

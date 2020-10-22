import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/forgot_password/forgot_password_content.dart';
import 'package:iwfpapp/services/config/typedefs/nav_config.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreen createState() {
    return _ForgotPasswordScreen();
  }
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  String email = 'Unknown Email';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      ForgotPasswordNavConfig navConfig =
          ModalRoute.of(context).settings.arguments;
      this.email = navConfig.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password?'),
      ),
      body: ForgotPasswordContent(
        email: this.email,
      ),
    );
  }
}

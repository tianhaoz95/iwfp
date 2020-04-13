import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/auth/auth_content.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      key: Key('login_screen'),
      body: PreferredWidthContent(
          child: AuthScreenContent()),
    );
  }
}

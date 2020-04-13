import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/config/typedefs/nav_config.dart';
import 'package:provider/provider.dart';

typedef Future<void> EmailSignInHandler(BuildContext context);
typedef void ForgetPasswordHandler(BuildContext context);

class AuthNotSignedInContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthNotSignedInContent();
  }
}

class _AuthNotSignedInContent extends State<AuthNotSignedInContent> {
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  void initState() {
    super.initState();
    this.emailInputController = TextEditingController();
    this.pwdInputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 45.0),
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Image(
              image:
                  AssetImage('assets/auth_screen_subtitle_high_resolution.png'),
            ),
          ),
          SizedBox(height: 45.0),
          TextField(
              controller: this.emailInputController,
              key: Key('sign_in_email_input'),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)))),
          SizedBox(height: 25.0),
          TextField(
              controller: this.pwdInputController,
              obscureText: true,
              key: Key('sign_in_password_input'),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)))),
          SizedBox(height: 25.0),
          Material(
            child: RaisedButton(
              color: Colors.green,
              key: Key('email_sign_in_btn'),
              child: Text(
                'Sign In with Email',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<AppAuth>(context, listen: false).signInWithEmail(
                    this.emailInputController.text,
                    this.pwdInputController.text);
              },
            ),
          ),
          Material(
            child: RaisedButton(
              color: Colors.redAccent,
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/forgot_password',
                    arguments: ForgotPasswordNavConfig(
                        email: emailInputController.text));
              },
            ),
          ),
          Material(
            child: RaisedButton(
              color: Colors.amber[900],
              child: Text(
                'Continue as Guest',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/placeholder');
              },
            ),
          ),
          Material(
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/sign_up');
              },
            ),
          ),
        ],
      ),
    );
  }
}

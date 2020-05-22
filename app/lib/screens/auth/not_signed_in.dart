import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/config/typedefs/nav_config.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
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
      child: ListView(
        key: Key('sign_in_form'),
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          ListViewItem(
            child: Image(
              image:
                  AssetImage('assets/auth_screen_subtitle_high_resolution.png'),
            ),
          ),
          ListViewItem(
              child: TextField(
                  controller: this.emailInputController,
                  key: Key('sign_in_email_input'),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: 'email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))))),
          ListViewItem(
              child: TextField(
                  controller: this.pwdInputController,
                  obscureText: true,
                  key: Key('sign_in_password_input'),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: 'password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))))),
          ListViewItem(
              child: Material(
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
          )),
          ListViewItem(
              child: Material(
            child: RaisedButton(
              color: Colors.green,
              key: Key('google_sign_in_btn'),
              child: Text(
                'Sign In with Google',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<AppAuth>(context, listen: false).signInWithGoogle();
              },
            ),
          )),
          ListViewItem(
              child: Material(
            child: RaisedButton(
              color: Colors.green,
              key: Key('github_sign_in_btn'),
              child: Text(
                'Sign In with GitHub',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<AppAuth>(context, listen: false).signInWithGitHub();
              },
            ),
          )),
          ListViewItem(
              child: Material(
            child: RaisedButton(
              color: Colors.redAccent,
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<AppAuth>(context, listen: false)
                    .resetSendPasswordResetEmailState();
                Navigator.pushNamed(context, '/forgot_password',
                    arguments: ForgotPasswordNavConfig(
                        email: emailInputController.text));
              },
            ),
          )),
          ListViewItem(
              child: Material(
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
          )),
          ListViewItem(
              child: Material(
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
          )),
        ],
      ),
    );
  }
}

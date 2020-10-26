import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/auth/not_signed_in/continue_as_guest.dart';
import 'package:iwfpapp/screens/auth/not_signed_in/github_sign_in.dart';
import 'package:iwfpapp/screens/auth/not_signed_in/google_sign_in.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/config/typedefs/nav_config.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
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
            child: SignInButton(
              Buttons.GitHub,
              text: 'Sign in with GitHub',
              onPressed: () {
                Provider.of<AppAuth>(context, listen: false)
                    .signInWithGitHub(context: context);
              },
            ),
          ),
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
          GoogleSignInBtn(),
          GitHubSignInBtn(),
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
          ContinueAsGuest(),
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

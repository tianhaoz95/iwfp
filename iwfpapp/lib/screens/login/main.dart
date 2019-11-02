import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/buttons/login_btn.dart';
import 'package:iwfpapp/widgets/buttons/glogin_btn.dart';
import 'package:iwfpapp/widgets/buttons/guest_login_btn.dart';
import 'package:iwfpapp/services/sign_in.dart';
import 'package:iwfpapp/widgets/buttons/logout_btn.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final emailInputController = TextEditingController();
  final pwdInputController = TextEditingController();

  void _showDialog(
      BuildContext context, String title, String body, String key) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              FlatButton(
                key: Key(key),
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void handleEmailSignIn(BuildContext context) async {
    String email = emailInputController.text;
    String pwd = pwdInputController.text;
    bool success = await iwfpappAuth.handleSignInWithEmail(email, pwd);
    if (success) {
      Navigator.pushNamed(context, '/main');
    } else {
      _showDialog(context, 'Sign in with email failed',
          'Please check your password.', 'sign_in_failed_prompt');
    }
  }

  Widget renderSignedIn() {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Image.asset(
                'assets/iwfp_splash.png',
                key: Key('iwfp_splash_img'),
              ),
          SizedBox(height: 25.0),
          LogoutButton(
            onPressedCallback: () {},
          )
        ],
      ),
    );
  }

  Widget renderNotSignedIn() {
    return Container(
          padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 15.0),
              Image.asset(
                'assets/iwfp_splash.png',
                key: Key('iwfp_splash_img'),
              ),
              SizedBox(height: 25.0),
              TextField(
                  controller: emailInputController,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: 'email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)))),
              SizedBox(height: 25.0),
              TextField(
                  controller: pwdInputController,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: 'password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)))),
              SizedBox(height: 25.0),
              LoginButton(
                onPressedCallback: () {
                  // Navigator.pushNamed(context, '/placeholder');
                  handleEmailSignIn(context);
                },
              ),
              SizedBox(height: 25.0),
              GuestLoginButton(
                onPressedCallback: () {
                  Navigator.pushNamed(context, '/main');
                },
              ),
              SizedBox(height: 25.0),
              GLoginButton(
                onPressedCallback: () {
                  Navigator.pushNamed(context, '/placeholder');
                },
              ),
            ],
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = renderNotSignedIn();
    if (iwfpappAuth.isSignedIn()) {
      bodyContent = renderSignedIn();
    }
    return Scaffold(
        appBar: AppBar(title: Text('Welcome to iwfp')),
        key: Key('login_screen'),
        backgroundColor: Colors.blue[100],
        body: bodyContent);
  }
}

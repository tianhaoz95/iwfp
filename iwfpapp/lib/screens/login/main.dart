import 'package:flutter/material.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/widgets/buttons/login_btn.dart';
import 'package:iwfpapp/widgets/buttons/glogin_btn.dart';
import 'package:iwfpapp/widgets/buttons/guest_login_btn.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/widgets/buttons/logout_btn.dart';
import 'package:iwfpapp/widgets/buttons/go_to_home_btn.dart';
import 'package:iwfpapp/services/mode.dart';

class LoginScreen extends StatefulWidget {
  final IwfpappAuth auth;
  final RunningMode mode;
  final DataStore dataStore;
  LoginScreen(this.auth, this.mode, this.dataStore);
  @override
  _LoginScreen createState() => _LoginScreen(auth, mode);
}

class _LoginScreen extends State<LoginScreen> {
  final emailInputController = TextEditingController();
  final pwdInputController = TextEditingController();
  final IwfpappAuth auth;
  final RunningMode mode;
  String status;

  _LoginScreen(this.auth, this.mode);

  @override
  void initState() {
    super.initState();
    status = 'loading';
    getSignInStatus();
  }

  Future<void> getSignInStatus() async {
    bool signedIn = await auth.isSignedIn();
    if (signedIn) {
      await widget.dataStore.fetchCards();
      setState(() {
        status = 'signed_in';
      });
    } else {
      setState(() {
        status = 'not_signed_in';
      });
    }
  }

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

  Future<void> handleEmailSignIn(BuildContext context) async {
    setState(() {
      status = 'loading';
    });
    String email = emailInputController.text;
    String pwd = pwdInputController.text;
    await auth.handleSignInWithEmail(email, pwd);
    await getSignInStatus();
    if (status == 'signed_in') {
      Navigator.pushNamed(context, '/main');
    } else {
      _showDialog(context, 'Sign in with email failed',
          'Please check your password.', 'sign_in_failed_prompt');
    }
  }

  Future<void> handleSignOut() async {
    this.setState(() {
      status = 'loading';
    });
    await auth.handleSignOut();
    await getSignInStatus();
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
          GoToHomeButton(
            onPressedCallback: () async {
              Navigator.pushNamed(context, '/main');
            },
          ),
          SizedBox(height: 25.0),
          LogoutButton(
            onPressedCallback: () async {
              await handleSignOut();
            },
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
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)))),
          SizedBox(height: 25.0),
          TextField(
              controller: pwdInputController,
              obscureText: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)))),
          SizedBox(height: 25.0),
          LoginButton(
            onPressedCallback: () async {
              await handleEmailSignIn(context);
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

  Widget renderLoading() {
    return Center(
        child: Container(
      child: CircularProgressIndicator(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = renderLoading();
    if (status == 'signed_in') {
      bodyContent = renderSignedIn();
    }
    if (status == 'not_signed_in') {
      bodyContent = renderNotSignedIn();
    }
    if (status == 'loading') {
      bodyContent = renderLoading();
    }
    return Scaffold(
        appBar: AppBar(title: Text(mode.devifyString('Welcome to iwfp'))),
        key: Key('login_screen'),
        backgroundColor: Colors.blue[100],
        body: bodyContent);
  }
}

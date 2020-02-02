import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/config/typedefs/nav_config.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/utilities/validators/email_validator.dart';
import 'package:iwfpapp/services/utilities/validators/sign_in_validator.dart';
import 'package:iwfpapp/widgets/buttons/logout_btn.dart';
import 'package:iwfpapp/widgets/buttons/go_to_home_btn.dart';
import 'package:iwfpapp/services/app_context/interface.dart';

class LoginScreen extends StatefulWidget {
  final AppAuth auth;
  final AppContext appContext;
  final DataBackend dataBackend;
  LoginScreen(this.auth, this.appContext, this.dataBackend);
  @override
  _LoginScreen createState() => _LoginScreen(auth);
}

class _LoginScreen extends State<LoginScreen> {
  final emailInputController = TextEditingController();
  final pwdInputController = TextEditingController();
  final AppAuth auth;
  String status;

  _LoginScreen(this.auth);

  @override
  void initState() {
    super.initState();
    status = 'loading';
    getSignInStatus();
  }

  Future<void> getSignInStatus() async {
    bool signedIn = await auth.isSignedIn();
    if (signedIn) {
      await widget.dataBackend.maybeRefreshCards();
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

  void handleForgetPassword(BuildContext context) async {
    String email = emailInputController.text;
    ValidationResponse response = isValidEmail(email);
    if (!response.valid) {
      await promptWarning(context, response.messages);
      return;
    }
    ForgotPasswordNavConfig navConfig = ForgotPasswordNavConfig(email: email);
    Navigator.pushNamed(context, '/forgot_password', arguments: navConfig);
  }

  Future<void> handleEmailSignIn(BuildContext context) async {
    String email = emailInputController.text;
    String pwd = pwdInputController.text;
    ValidationResponse signInValidationResponse = isValidSignInInfo(email, pwd);
    if (!signInValidationResponse.valid) {
      await promptWarning(context, signInValidationResponse.messages);
      return;
    }
    setState(() {
      status = 'loading';
    });
    await auth.handleSignInWithEmail(email, pwd);
    await getSignInStatus();
    if (status == 'signed_in') {
      Navigator.pushReplacementNamed(context, '/');
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
          SizedBox(height: 25.0),
          Container(
            child: Center(
              child: Text('Welcome Back!'),
            ),
            key: Key('sign_in_welcome_back_title'),
          ),
          SizedBox(height: 25.0),
          GoToHomeButton(
            onPressedCallback: () async {
              Navigator.pushReplacementNamed(context, '/');
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
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Image(
              image: AssetImage('assets/auth_screen_logo_high_resolution.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: Image(
              image:
                  AssetImage('assets/auth_screen_subtitle_high_resolution.png'),
            ),
          ),
          SizedBox(height: 45.0),
          TextField(
              controller: emailInputController,
              key: Key('sign_in_email_input'),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)))),
          SizedBox(height: 25.0),
          TextField(
              controller: pwdInputController,
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
              onPressed: () async {
                await handleEmailSignIn(context);
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
                handleForgetPassword(context);
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
                Navigator.pushReplacementNamed(context, '/sign_up');
              },
            ),
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
        appBar: AppBar(title: Text(widget.appContext.devifyString('Welcome'))),
        key: Key('login_screen'),
        body: bodyContent);
  }
}

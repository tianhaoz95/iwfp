import 'package:flutter/material.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/services/config/typedefs/auth_status.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/utilities/validators/register_validator.dart';

class SignUpScreen extends StatefulWidget {
  final IwfpappAuth auth;
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

  Widget renderPendingContent(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: TextField(
                  controller: emailCtrl,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: 'email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))))),
          SizedBox(
            height: 5.0,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: TextField(
                  controller: pwdCtrl,
                  obscureText: true,
                  key: Key('sign_up_pwd_input'),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: 'password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))))),
          SizedBox(
            height: 5.0,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: TextField(
                  controller: pwdConfirmCtrl,
                  obscureText: true,
                  key: Key('sign_up_pwd_confirmation_input'),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: 'confirm password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))))),
          Material(
              child: Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {
                handleSignUp();
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
          Material(
              child: Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              color: Colors.amber[900],
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/sign_in');
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget renderUnknownContent(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Material(
              color: Colors.blue[100],
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Unknown Error! Go Back!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              )),
        ],
      ),
    );
  }

  Widget renderLoadingContent(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget renderDoneContent(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Material(
              child: Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/sign_in');
              },
              child: Text(
                'Done! Sign in.',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget renderErrorContent(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Text(msg),
          Material(
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/sign_in');
              },
              child: Text('Error, back to login'),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderContent(BuildContext context) {
    Widget content = renderUnknownContent(context);
    switch (status) {
      case SubmitScreenStatus.PENDING:
        content = renderPendingContent(context);
        break;
      case SubmitScreenStatus.LOADING:
        content = renderLoadingContent(context);
        break;
      case SubmitScreenStatus.ERROR:
        content = renderErrorContent(context);
        break;
      case SubmitScreenStatus.DONE:
        content = renderDoneContent(context);
        break;
      default:
        content = renderUnknownContent(context);
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up for iwfpapp'),
      ),
      body: renderContent(context),
    );
  }
}

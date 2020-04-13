import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:provider/provider.dart';

class RegisterFormSignUpScreenContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterFormSignUpScreenContent();
  }
}

class _RegisterFormSignUpScreenContent extends State<RegisterFormSignUpScreenContent> {
  TextEditingController emailCtrl;
  TextEditingController pwdCtrl;
  TextEditingController pwdConfirmCtrl;

  @override
  void initState() {
    super.initState();
    this.emailCtrl = TextEditingController();
    this.pwdCtrl = TextEditingController();
    this.pwdConfirmCtrl = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
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
                String email = emailCtrl.text;
                String pwd = pwdCtrl.text;
                String pwdConfirm = pwdConfirmCtrl.text;
                Provider.of<AppAuth>(context, listen: false).signUpWithEmail(email, pwd, pwdConfirm);
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
                Navigator.pop(context);
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
}

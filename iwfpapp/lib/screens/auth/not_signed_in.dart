import 'package:flutter/material.dart';

typedef Future<void> EmailSignInHandler(BuildContext context);
typedef void ForgetPasswordHandler(BuildContext context);

class AuthNotSignedInContent extends StatefulWidget {
  final bool enabled;
  final EmailSignInHandler emailSignInHandler;
  final ForgetPasswordHandler forgetPasswordHandler;
  final TextEditingController emailInputController;
  final TextEditingController pwdInputController;
  const AuthNotSignedInContent(
      {this.enabled,
      this.emailSignInHandler,
      this.forgetPasswordHandler,
      this.emailInputController,
      this.pwdInputController});
  @override
  State<StatefulWidget> createState() {
    return _AuthNotSignedInContent();
  }
}

class _AuthNotSignedInContent extends State<AuthNotSignedInContent> {
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
              controller: widget.emailInputController,
              key: Key('sign_in_email_input'),
              decoration: InputDecoration(
                  enabled: widget.enabled,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)))),
          SizedBox(height: 25.0),
          TextField(
              controller: widget.pwdInputController,
              obscureText: true,
              key: Key('sign_in_password_input'),
              decoration: InputDecoration(
                  enabled: widget.enabled,
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
              onPressed: widget.enabled
                  ? () {
                      widget.emailSignInHandler(context);
                    }
                  : null,
            ),
          ),
          Material(
            child: RaisedButton(
              color: Colors.redAccent,
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: widget.enabled
                  ? () {
                      widget.emailSignInHandler(context);
                    }
                  : null,
            ),
          ),
          Material(
            child: RaisedButton(
              color: Colors.amber[900],
              child: Text(
                'Continue as Guest',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: widget.enabled
                  ? () {
                      Navigator.pushNamed(context, '/placeholder');
                    }
                  : null,
            ),
          ),
          Material(
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: widget.enabled
                  ? () {
                      Navigator.pushNamed(context, '/sign_up');
                    }
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

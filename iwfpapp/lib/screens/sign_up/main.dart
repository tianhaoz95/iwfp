import 'package:flutter/material.dart';
import 'package:iwfpapp/services/status.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreen createState() {
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State<SignUpScreen> {
  SubmitScreenStatus status = SubmitScreenStatus.PENDING;

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
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      hintText: 'confirm password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))))),
          Material(
              color: Colors.blue[100],
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {},
                  child: Text('Register', style: TextStyle(color: Colors.white),),
                ),
              )),
          Material(
              color: Colors.blue[100],
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                child: RaisedButton(
                  color: Colors.amber[900],
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/sign_in');
                  },
                  child: Text('Cancel', style: TextStyle(color: Colors.white),),
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

  Widget renderContent(BuildContext context) {
    Widget content = renderUnknownContent(context);
    switch (status) {
      case SubmitScreenStatus.PENDING:
        content = renderPendingContent(context);
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
      backgroundColor: Colors.blue[100],
      body: renderContent(context),
    );
  }
}

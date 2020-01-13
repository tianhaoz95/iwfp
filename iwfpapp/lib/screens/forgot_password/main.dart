import 'package:flutter/material.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/services/config/typedefs/auth_status.dart';
import 'package:iwfpapp/services/config/typedefs/nav_config.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final IwfpappAuth auth;
  const ForgotPasswordScreen(this.auth);
  @override
  _ForgotPasswordScreen createState() {
    return _ForgotPasswordScreen();
  }
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  SubmitScreenStatus status = SubmitScreenStatus.LOADING;
  String email = 'Unknown Email';
  bool sendEmail = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      ForgotPasswordNavConfig navConfig =
          ModalRoute.of(context).settings.arguments;
      status = navConfig.status;
      email = navConfig.email;
      sendEmail = navConfig.sendEmail;
      if (sendEmail) {
        handleSendPasswordResetEmail(email);
      }
    }
  }

  Future<void> handleSendPasswordResetEmail(String email) async {
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    SendPasswordResetEmailResponse response =
        await widget.auth.handleSendPasswordResetEmail(email);
    if (response.status == AuthStatus.SUCCESS) {
      setState(() {
        status = SubmitScreenStatus.DONE;
      });
    } else if (response.status == AuthStatus.FAIL) {
      setState(() {
        status = SubmitScreenStatus.ERROR;
      });
    } else {
      setState(() {
        status = SubmitScreenStatus.UNKNOWN;
      });
    }
  }

  Widget renderErrorContent(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Error :('),
      ),
    );
  }

  Widget renderUnknownContent(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Unknown Error :('),
      ),
    );
  }

  Widget renderLoadingContent(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          LinearProgressIndicator(
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 35.0,
          ),
          Container(
            child: Center(
              child: Text('Sending password reset email to'),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Center(
              child: Text(email),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Center(
              child: Text('Please wait...'),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderDoneContent(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 35.0,
          ),
          Container(
            child: Center(
              child: Text('An email with instructions to reset password'),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Center(
              child: Text('has been sent to'),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Center(
              child: Text(email),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            child: Center(
              child: Text('Please follow the steps and check back later'),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderContent(BuildContext context) {
    Widget content = renderUnknownContent(context);
    switch (status) {
      case SubmitScreenStatus.DONE:
        content = renderDoneContent(context);
        break;
      case SubmitScreenStatus.LOADING:
        content = renderLoadingContent(context);
        break;
      case SubmitScreenStatus.ERROR:
        content = renderErrorContent(context);
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
        title: Text('Forgot Password?'),
      ),
      body: renderContent(context),
    );
  }
}

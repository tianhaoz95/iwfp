import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorScreenArgs {
  String errorTitle;
  String errorMsg;
  String recoverRoute;

  ErrorScreenArgs(this.errorTitle, this.errorMsg, this.recoverRoute);
}

class ErrorScreenWithRecoverRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ErrorScreenArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Error Occured'),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 12.0,
            ),
            Container(
              child: Text('Error type: ${args.errorTitle}'),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              child: Text('Error message: ${args.errorMsg}'),
            ),
            SizedBox(
              height: 12.0,
            ),
            RaisedButton(
              child: Text('Try again'),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(args.recoverRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}

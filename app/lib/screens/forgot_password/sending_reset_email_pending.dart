import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:provider/provider.dart';

class SendingResetEmailPending extends StatelessWidget {
  final String email;
  const SendingResetEmailPending({@required this.email});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('send email?'),
          RaisedButton(
            onPressed: () {
              Provider.of<AppAuth>(context, listen: false)
                  .sendPasswordResetEmail(this.email);
            },
            child: Text('send!'),
          )
        ],
      ),
    );
  }
}

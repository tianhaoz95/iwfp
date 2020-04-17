import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class SendingResetEmailPending extends StatelessWidget {
  final String email;
  const SendingResetEmailPending({@required this.email});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListViewItem(
            child: Center(
              child: Text('An reset email will be sent to:'),
            ),
          ),
          ListViewItem(
            child: Center(
              child: Text(this.email),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                onPressed: () {
                  Provider.of<AppAuth>(context, listen: false)
                      .sendPasswordResetEmail(this.email);
                },
                child: Text('Send!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

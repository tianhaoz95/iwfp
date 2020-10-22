import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class SignUpScreenErrorContent extends StatelessWidget {
  final errMsg;
  const SignUpScreenErrorContent({this.errMsg = 'Unknown'});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListViewItem(
            child: Center(
              child: Text(this.errMsg),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Try again'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

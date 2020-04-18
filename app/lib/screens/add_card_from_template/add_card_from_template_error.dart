import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class AddCardFromTemplateError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        ListViewItem(
          child: Material(
            child: Card(
              child: Container(
                  child: Center(
                      child: Text(
                'Error using template',
              ))),
            ),
          ),
        ),
        ListViewItem(
            child: Material(
          child: RaisedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text('Back'),
          ),
        )),
      ],
    ));
  }
}

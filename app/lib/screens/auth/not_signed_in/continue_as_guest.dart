import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_context/base_app_context.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class ContinueAsGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppContext>(
      builder: (BuildContext context, AppContext appContext, Widget child) {
        if (appContext.allowContinueAsGuest()) {
          return ListViewItem(
              child: Material(
            child: RaisedButton(
              color: Colors.amber[900],
              child: Text(
                'Continue as Guest',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/placeholder');
              },
            ),
          ));
        } else {
          return Container();
        }
      },
    );
  }
}

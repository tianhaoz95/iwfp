import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/delete_account/delete_account_content.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

class DeleteAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Account?'),
        leading: FlatButton(
          key: Key('delete_account_back_btn'),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/',
                arguments: HomeTabId.USER_SETTINGS);
          },
        ),
      ),
      body: PreferredWidthContent(child: DeleteAccountContent()),
    );
  }
}

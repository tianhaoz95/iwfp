import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/nav_config.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';

class ScreenTester extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Tester'),
        leading: FlatButton(
          key: Key('suggestion_back_btn'),
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
      body: Container(
        child: ListView(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                DevNavConfig config = DevNavConfig(SubmitScreenStatus.LOADING);
                Navigator.pushNamed(context, '/add_card', arguments: config);
              },
              child: Text('Test add card loading ->'),
            ),
            FlatButton(
              onPressed: () {
                ForgotPasswordNavConfig navConfig = ForgotPasswordNavConfig(
                    email: 'jacksonzhou666@gmail.com',
                    statusOverride: SubmitScreenStatus.DONE,
                    sendEmailOverride: false);
                Navigator.pushNamed(context, '/forgot_password',
                    arguments: navConfig);
              },
              child: Text('Test forgot password done ->'),
            ),
            FlatButton(
              onPressed: () {
                ForgotPasswordNavConfig navConfig = ForgotPasswordNavConfig(
                    email: 'jacksonzhou666@gmail.com',
                    statusOverride: SubmitScreenStatus.LOADING,
                    sendEmailOverride: false);
                Navigator.pushNamed(context, '/forgot_password',
                    arguments: navConfig);
              },
              child: Text('Test forgot password loading ->'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/user/developer/developer_section.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/app_context/interface.dart';

class UserSettings extends StatefulWidget {
  final AppContext appContext;
  final AppAuth appAuth;
  const UserSettings(this.appContext, this.appAuth);
  @override
  _UserSettings createState() {
    return _UserSettings();
  }
}

class _UserSettings extends State<UserSettings> {
  bool nextIsDevFlagVal = false;
  @override
  void initState() {
    super.initState();
    nextIsDevFlagVal = widget.appContext.isDevMode();
  }

  handleUpdateSettings(BuildContext context) {
    widget.appContext.setRunningMode(nextIsDevFlagVal);
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key('user_screen_content'),
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            DeveloperSection(widget.appAuth, widget.appContext, this.handleUpdateSettings),
            Container(
              child: Center(
                child: Text('User Settings'),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: RaisedButton(
                key: Key('go_to_auth_btn'),
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Sign out',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/sign_in');
                },
              ),
            ),
            Divider(),
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: Center(
                child: Text(
                  'Dangerous Zone',
                  key: Key('settings_screen_dangerous_zone_warning'),
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ),
            Divider(
              key: Key('settings_screen_dangerous_zone_divider'),
              color: Colors.redAccent,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/delete_account');
                },
                color: Colors.redAccent,
                child: Text(
                  'Delete Account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}

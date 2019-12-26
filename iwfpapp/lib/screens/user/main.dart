import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/user/develop_card.dart';
import 'package:iwfpapp/services/mode.dart';
import 'package:iwfpapp/screens/user/update_settings_btn.dart';

class UserSettings extends StatefulWidget {
  final RunningMode mode;
  const UserSettings(this.mode);
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
    nextIsDevFlagVal = widget.mode.isDevMode();
  }

  handleUpdateSettings(BuildContext context) {
    widget.mode.setRunningMode(nextIsDevFlagVal);
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key('contrib_screen_content'),
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            DevelopCard(widget.mode.isDevMode(), (bool nextDevVal) {
              nextIsDevFlagVal = nextDevVal;
            }),
            UpdateSettingsButton(handleUpdateSettings),
            Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: RaisedButton(
                key: Key('go_to_auth_btn'),
                color: Colors.orange,
                child: Text(
                  'Go to Authentication',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/sign_in');
                },
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: Center(
                child: Text('Dangerous Zone',
                    style: TextStyle(color: Colors.redAccent)),
              ),
            ),
            Divider(
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

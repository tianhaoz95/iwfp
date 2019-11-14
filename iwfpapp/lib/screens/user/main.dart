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
    Navigator.pushReplacementNamed(context, '/main');
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
          ],
        ));
  }
}

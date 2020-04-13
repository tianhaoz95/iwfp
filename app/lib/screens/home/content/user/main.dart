import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/user/developer/developer_section.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';
import 'package:provider/provider.dart';

class UserSettings extends StatefulWidget {
  const UserSettings();
  @override
  _UserSettings createState() {
    return _UserSettings();
  }
}

class _UserSettings extends State<UserSettings> {
  bool nextIsDevFlagVal = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    nextIsDevFlagVal =
        Provider.of<AppContext>(context, listen: false).isDevMode();
  }

  handleUpdateSettings(BuildContext context) {
    Provider.of<AppContext>(context, listen: false)
        .setRunningMode(nextIsDevFlagVal);
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return PreferredWidthContent(
        child: Container(
            key: Key('user_screen_content'),
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                ),
                DeveloperSection(this.handleUpdateSettings),
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
                      Navigator.pushReplacementNamed(
                          context, '/delete_account');
                    },
                    color: Colors.redAccent,
                    child: Text(
                      'Delete Account',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )));
  }
}

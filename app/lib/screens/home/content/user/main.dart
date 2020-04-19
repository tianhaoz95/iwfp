import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/user/theme_selector.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
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
    return Container(
        key: Key('user_screen_content'),
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        child: ListView(
          children: <Widget>[
            ListViewItem(
              child: Text(
                'Change Theme',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            ListViewItem(
              child: ThemeSelector(),
            ),
            Divider(
              thickness: 1.0,
            ),
            ListViewItem(
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
            Divider(
              thickness: 1.0,
            ),
            ListViewItem(
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

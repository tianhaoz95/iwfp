import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/user/auth_settings/auth_settings.dart';
import 'package:iwfpapp/screens/home/content/user/dangerous_settings/dangerous_settings.dart';
import 'package:iwfpapp/screens/home/content/user/theme_settings/theme_settings.dart';
import 'package:iwfpapp/services/app_context/base_app_context.dart';
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
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            ListViewItem(
              child: ThemeSettings(),
            ),
            Divider(
              thickness: 1.0,
            ),
            ListViewItem(
              child: AuthSettings(),
            ),
            Divider(
              thickness: 1.0,
            ),
            ListViewItem(
              child: DangerousSettings(),
            ),
          ],
        ));
  }
}

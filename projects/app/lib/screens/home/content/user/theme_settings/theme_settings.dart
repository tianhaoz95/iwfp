import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/user/theme_settings/theme_selector.dart';
import 'package:iwfpapp/screens/home/content/user/theme_settings/use_system_toggle.dart';

class ThemeSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Theme',
            style: TextStyle(fontSize: 24.0),
          ),
          UseSystemThemeToggle(),
          SizedBox(
            height: 12.0,
          ),
          ThemeSelector(),
        ],
      ),
    );
  }
}

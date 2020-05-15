import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';

class UseSystemThemeToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text('Use system theme settings'),
          Switch(
            onChanged: (bool value) {
              Provider.of<AppTheme>(context, listen: false).setUseSystem(value);
            },
            value: Provider.of<AppTheme>(context).getUseSystem(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:iwfpapp/services/theme/theme_mapping.dart';
import 'package:iwfpapp/services/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Material(
            child: RaisedButton(
              color: getThemeColor(ThemeType.GREEN),
              onPressed: () {
                Provider.of<AppTheme>(context, listen: false)
                    .setTheme(ThemeType.GREEN);
              },
              child: Text(getThemeText(ThemeType.GREEN)),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Material(
            child: RaisedButton(
              color: getThemeColor(ThemeType.PINK),
              onPressed: () {
                Provider.of<AppTheme>(context, listen: false)
                    .setTheme(ThemeType.PINK);
              },
              child: Text(getThemeText(ThemeType.PINK)),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          Material(
            child: RaisedButton(
              color: getThemeColor(ThemeType.DARK),
              onPressed: () {
                Provider.of<AppTheme>(context, listen: false)
                    .setTheme(ThemeType.DARK);
              },
              child: Text(getThemeText(ThemeType.DARK)),
            ),
          ),
        ],
      ),
    );
  }
}

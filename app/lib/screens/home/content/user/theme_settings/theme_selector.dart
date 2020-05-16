import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:iwfpapp/services/theme/util/theme_mapping.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:provider/provider.dart';

class ColorSelectorCard extends StatelessWidget {
  final ThemeType themeType;

  const ColorSelectorCard({Key key, this.themeType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 4.0, 8.0, 4.0),
        child: SizedBox(
          width: 32.0,
          child: Material(
            child: RaisedButton(
              color: getThemeColor(this.themeType),
              onPressed: () {
                Provider.of<AppTheme>(context, listen: false)
                    .setTheme(this.themeType);
              },
              child: Container(),
            ),
          ),
        ));
  }
}

class ThemeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<AppTheme>(context).getUseSystem()) {
      return Container();
    } else {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text('Select Theme', style: TextStyle(
                fontSize: 16.0,
              ),),
            ),
            SizedBox(
              height: 36.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ColorSelectorCard(themeType: ThemeType.WHITE),
                  ColorSelectorCard(themeType: ThemeType.GREEN),
                  ColorSelectorCard(themeType: ThemeType.PINK),
                  ColorSelectorCard(themeType: ThemeType.DARK),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}

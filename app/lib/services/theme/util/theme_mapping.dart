import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';

Color getThemeColor(ThemeType type) {
  Map<ThemeType, Color> themeColorMapping = {
    ThemeType.GREEN: Colors.green,
    ThemeType.PINK: Colors.pink,
    ThemeType.DARK: Colors.black,
  };
  return themeColorMapping[type];
}

String getThemeText(ThemeType type) {
  Map<ThemeType, String> themeTextMapping = {
    ThemeType.GREEN: 'Green',
    ThemeType.PINK: 'Pink',
    ThemeType.DARK: 'Dark',
  };
  return themeTextMapping[type];
}

ThemeType getThemeType(String type) {
  Map<String, ThemeType> themeTypeMapping = {
    'Green': ThemeType.GREEN,
    'Pink': ThemeType.PINK,
    'Dark': ThemeType.DARK,
  };
  return themeTypeMapping[type];
}

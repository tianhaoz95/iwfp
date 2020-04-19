import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:iwfpapp/services/theme/dark_theme.dart';
import 'package:iwfpapp/services/theme/green_theme.dart';
import 'package:iwfpapp/services/theme/pink_theme.dart';

class AppTheme extends ChangeNotifier {
  ThemeType themeType;
  bool useSystem;

  AppTheme({this.themeType = ThemeType.GREEN, this.useSystem = true});

  void setTheme(ThemeType type) {
    themeType = type;
    notifyListeners();
  }

  void setUseSystem(bool shouldUse) {
    useSystem = shouldUse;
    notifyListeners();
  }

  ThemeData getTheme() {
    switch (this.themeType) {
      case ThemeType.GREEN:
        return greenTheme;
      case ThemeType.PINK:
        return pinkTheme;
      case ThemeType.DARK:
        return darkTheme;
      default:
        return greenTheme;
    }
  }

  ThemeData getDarkTheme() {
    if (useSystem) {
      return darkTheme;
    } else {
      return getTheme();
    }
  }
}

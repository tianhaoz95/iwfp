import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:iwfpapp/services/theme/data/dark_theme.dart';
import 'package:iwfpapp/services/theme/data/green_theme.dart';
import 'package:iwfpapp/services/theme/data/pink_theme.dart';
import 'package:iwfpapp/services/theme/data/white_theme.dart';

/// App Theme
/// 
/// This is the service provider that controls the
/// overall theme for the app.
/// It is implemented with:
/// * [MockAppTheme] which is used for local development
/// and unit testing with no persistent backend.
/// * [OfflineAppTheme] which uses local storage to store
/// the theme configuration.
abstract class AppTheme extends ChangeNotifier {
  ThemeType themeType;
  bool useSystem;

  AppTheme({this.themeType = ThemeType.WHITE, this.useSystem = false});

  void setTheme(ThemeType type) {
    themeType = type;
    persistSettings();
    notifyListeners();
  }

  void setUseSystem(bool shouldUse) {
    useSystem = shouldUse;
    persistSettings();
    notifyListeners();
  }

  bool getUseSystem() {
    return useSystem;
  }

  ThemeData getCustomTheme() {
    switch (this.themeType) {
      case ThemeType.GREEN:
        return greenTheme;
      case ThemeType.PINK:
        return pinkTheme;
      case ThemeType.DARK:
        return darkTheme;
      case ThemeType.WHITE:
        return whiteTheme;
      default:
        return greenTheme;
    }
  }

  ThemeData getLightTheme() {
    if (useSystem) {
      return whiteTheme;
    } else {
      return getCustomTheme();
    }
  }

  ThemeData getDarkTheme() {
    if (useSystem) {
      return darkTheme;
    } else {
      return getCustomTheme();
    }
  }

  bool needHive();

  Future<void> initialize();

  Future<void> loadSettings();

  Future<void> persistSettings();
}

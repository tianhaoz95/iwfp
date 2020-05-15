import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:iwfpapp/services/theme/data/dark_theme.dart';
import 'package:iwfpapp/services/theme/data/green_theme.dart';
import 'package:iwfpapp/services/theme/data/pink_theme.dart';

class MockThemeProvider extends AppTheme {
  ThemeType themeType;
  bool useSystem;

  MockThemeProvider({this.themeType = ThemeType.GREEN, this.useSystem = false});

  @override
  bool needHive() {
    return false;
  }

  @override
  Future<void> initialize() async {
    await Future.delayed(Duration(microseconds: 200));
  }

  @override
  void setTheme(ThemeType type) {
    themeType = type;
    notifyListeners();
  }

  @override
  void setUseSystem(bool shouldUse) {
    useSystem = shouldUse;
    notifyListeners();
  }

  @override
  bool getUseSystem() {
    return useSystem;
  }

  @override
  Future<void> loadSettings() async {
    await Future.delayed(Duration(microseconds: 200));
  }

  @override
  Future<void> persistSettings() async {
    await Future.delayed(Duration(microseconds: 200));
  }

  @override
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

  @override
  ThemeData getDarkTheme() {
    if (useSystem) {
      return darkTheme;
    } else {
      return getTheme();
    }
  }
}

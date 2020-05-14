import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:iwfpapp/services/theme/data/dark_theme.dart';
import 'package:iwfpapp/services/theme/data/green_theme.dart';
import 'package:iwfpapp/services/theme/data/pink_theme.dart';
import 'package:iwfpapp/services/theme/util/theme_mapping.dart';

class OfflineAppTheme extends AppTheme {
  ThemeType themeType;
  Box themeDb;
  bool useSystem;

  OfflineAppTheme({this.themeType = ThemeType.GREEN, this.useSystem = false});

  @override
  bool needHive() {
    return true;
  }

  Future<void> initialize() async {
    themeDb = await Hive.openBox('theme');
    await loadSettings();
    notifyListeners();
  }

  void setTheme(ThemeType type) {
    themeType = type;
    persistSettings();
    notifyListeners();
  }

  void setUseSystem(bool shouldUse) {
    useSystem = shouldUse;
    notifyListeners();
  }

  Future<void> loadSettings() async {
    await Future.delayed(Duration(microseconds: 200));
    String themeTypeName = themeDb.get('type');
    ThemeType parsedThemeType = getThemeType(themeTypeName);
    if (parsedThemeType != null) {
      print('load theme settings with type ${parsedThemeType}');
      themeType = parsedThemeType;
    }
  }

  Future<void> persistSettings() async {
    await Future.delayed(Duration(microseconds: 200));
    themeDb.put('type', getThemeText(themeType));
    print('theme settings saved');
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

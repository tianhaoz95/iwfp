import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:iwfpapp/services/theme/data/dark_theme.dart';
import 'package:iwfpapp/services/theme/data/green_theme.dart';
import 'package:iwfpapp/services/theme/data/pink_theme.dart';
import 'package:iwfpapp/services/theme/data/white_theme.dart';
import 'package:iwfpapp/services/theme/util/theme_mapping.dart';

class OfflineAppTheme extends AppTheme {
  ThemeType themeType;
  Box themeDb;
  bool useSystem;

  OfflineAppTheme({this.themeType = ThemeType.WHITE, this.useSystem = false});

  @override
  bool needHive() {
    return true;
  }

  @override
  Future<void> initialize() async {
    themeDb = await Hive.openBox('theme');
    await loadSettings();
    notifyListeners();
  }

  @override
  void setTheme(ThemeType type) {
    themeType = type;
    persistSettings();
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
    try {
      await Future.delayed(Duration(microseconds: 200));
      String themeTypeName = themeDb.get('type');
      ThemeType parsedThemeType = getThemeType(themeTypeName);
      if (parsedThemeType != null) {
        print('load theme settings with type ${parsedThemeType}');
        themeType = parsedThemeType;
      }
      bool useSystemSettings = themeDb.get('type').toLowerCase() == 'true';
      ;
      print('load theme settings with type ${useSystemSettings}');
      useSystem = useSystemSettings;
    } catch (err) {
      print('error loading theme config: ' + err.toString());
      useSystem = false;
      themeType = ThemeType.GREEN;
    }
  }

  @override
  Future<void> persistSettings() async {
    await Future.delayed(Duration(microseconds: 200));
    themeDb.put('type', getThemeText(themeType));
    themeDb.put('useSystem', this.useSystem.toString());
    print('theme settings saved');
  }

  @override
  ThemeData getTheme() {
    if (useSystem) {
      return whiteTheme;
    } else {
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

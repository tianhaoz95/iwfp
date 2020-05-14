import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:iwfpapp/services/theme/data/dark_theme.dart';
import 'package:iwfpapp/services/theme/data/green_theme.dart';

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
  }

  @override
  void setUseSystem(bool shouldUse) {
    useSystem = shouldUse;
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
    return greenTheme;
  }

  @override
  ThemeData getDarkTheme() {
    return darkTheme;
  }
}

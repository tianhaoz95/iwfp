import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';

abstract class AppTheme extends ChangeNotifier {
  bool needHive();

  Future<void> initialize();

  void setTheme(ThemeType type);

  void setUseSystem(bool shouldUse);

  bool getUseSystem();

  Future<void> loadSettings();

  Future<void> persistSettings();

  ThemeData getTheme();

  ThemeData getDarkTheme();
}

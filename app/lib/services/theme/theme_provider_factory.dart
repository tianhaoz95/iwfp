import 'package:iwfpapp/services/config/typedefs/app_theme_types.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:iwfpapp/services/theme/mock_theme_provider.dart';
import 'package:iwfpapp/services/theme/offline_theme_provider.dart';

AppTheme getAppTheme(AppThemeType type,
    {ThemeType theme = ThemeType.WHITE, bool useSystem = true}) {
  switch (type) {
    case AppThemeType.OFFLINE:
      return OfflineAppTheme(themeType: theme, useSystem: useSystem);
    case AppThemeType.MOCK:
      return MockThemeProvider(themeType: theme, useSystem: useSystem);
    default:
      return OfflineAppTheme(themeType: theme, useSystem: useSystem);
  }
}

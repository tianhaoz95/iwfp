import 'package:iwfpapp/services/config/typedefs/app_theme_types.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:iwfpapp/services/theme/mock_theme_provider.dart';
import 'package:iwfpapp/services/theme/offline_theme_provider.dart';

/// App Theme Getter
///
/// This is a utility wrapper that abstract the creation of
/// theme service provider. Code outside the theme directory
/// should only use this method to access theme service.
AppTheme getAppTheme(AppThemeType type,
    {ThemeType theme = ThemeType.WHITE, bool useSystem = true}) {
  switch (type) {
    case AppThemeType.OFFLINE:
      return OfflineAppTheme(themeType: theme, useSystem: useSystem);
    case AppThemeType.MOCK:
      return MockAppTheme(themeType: theme, useSystem: useSystem);
    default:
      return OfflineAppTheme(themeType: theme, useSystem: useSystem);
  }
}

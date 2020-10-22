import 'package:hive/hive.dart';
import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:iwfpapp/services/theme/util/theme_mapping.dart';

/// Offline App Theme
///
/// This implementation of [AppTheme] uses Hive, a local
/// key-val pair storage solution as backend to persist
/// theme settings and configurations between app sessions.
class OfflineAppTheme extends AppTheme {
  Box themeDb;

  OfflineAppTheme({
    ThemeType themeType = ThemeType.WHITE,
    bool useSystem = false,
  }) : super(
          themeType: themeType,
          useSystem: useSystem,
        );

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
  Future<void> loadSettings() async {
    try {
      await Future.delayed(Duration(microseconds: 200));
      String themeTypeName = themeDb.get('type');
      ThemeType parsedThemeType = getThemeType(themeTypeName);
      if (parsedThemeType != null) {
        print('load theme settings with type ${parsedThemeType}');
        themeType = parsedThemeType;
      }
      bool useSystemSettings = themeDb.get('useSystem') != null
          ? themeDb.get('useSystem').toLowerCase() == 'true'
          : false;
      print('useSystemSettings: ${useSystemSettings}');
      useSystem = useSystemSettings;
      notifyListeners();
    } catch (err) {
      print('Error loading theme config');
      print('Reason: ' + err.toString());
      useSystem = false;
      themeType = ThemeType.WHITE;
      notifyListeners();
    }
  }

  @override
  Future<void> persistSettings() async {
    await Future.delayed(Duration(microseconds: 200));
    themeDb.put('type', getThemeText(themeType));
    themeDb.put('useSystem', this.useSystem.toString());
    print('theme settings saved');
  }
}

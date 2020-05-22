import 'package:iwfpapp/services/config/typedefs/theme_type.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';

/// Mock App Theme
///
/// This is a dummy implementation of [AppTheme] which
/// is used for local development and unit testing.
/// All of its methods are trivial conforming only to
/// the async nature of the base class restriction.
class MockAppTheme extends AppTheme {
  MockAppTheme({
    ThemeType themeType = ThemeType.WHITE,
    bool useSystem = false,
  }) : super(
          themeType: themeType,
          useSystem: useSystem,
        );

  @override
  bool needHive() {
    return false;
  }

  @override
  Future<void> initialize() async {
    await Future.delayed(Duration(microseconds: 200));
  }

  @override
  Future<void> loadSettings() async {
    await Future.delayed(Duration(microseconds: 200));
  }

  @override
  Future<void> persistSettings() async {
    await Future.delayed(Duration(microseconds: 200));
  }
}

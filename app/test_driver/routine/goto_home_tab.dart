import 'package:flutter_driver/flutter_driver.dart';

Future<void> gotoHomeTab(
    FlutterDriver driver, bool isDrawerLayout, String key) async {
  if (isDrawerLayout) {
    await driver.tap(find.byTooltip('Open navigation menu'));
    await driver.scrollUntilVisible(
        find.byValueKey('vertical_home_menu'), find.byValueKey(key));
  }
  await driver.tap(find.byValueKey(key));
}

import 'package:flutter_driver/flutter_driver.dart';
import 'package:logger/logger.dart';

import '../utilities/maybe_tap.dart';

Future<void> gotoHomeTab(FlutterDriver driver, bool isDrawerLayout, String key,
    Logger logger) async {
  logger.d('Navigate to tab with key ${key}.');
  if (isDrawerLayout) {
    // This is a hack to make it work for web, the normal version should
    // be the following:
    // await driver.tap(find.byTooltip('Open navigation menu'));
    await maybeTap(driver, find.byTooltip('Open navigation menu'), logger);
    logger.d('Navigation menu opened.');
    await driver.scrollUntilVisible(
        find.byValueKey('vertical_home_menu'), find.byValueKey(key));
    logger.d('Scrolled to target');
  }
  await driver.tap(find.byValueKey(key));
  logger.d('Tap home tab with key ${key} success.');
}

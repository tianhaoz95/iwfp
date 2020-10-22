import 'package:flutter_driver/flutter_driver.dart';
import 'package:logger/logger.dart';

import 'generic_finder.dart';

Future<bool> isDrawerLayout(FlutterDriver driver, Logger logger) async {
  logger.d('Check drawer layout.');
  bool foundDrawerBtn = await isElementExist(
      driver, find.byTooltip('Open navigation menu'), logger,
      targetName: 'drawer layout');
  logger.d('Drawer btn lookup result: ${foundDrawerBtn}');
  return foundDrawerBtn;
}

import 'package:flutter_driver/flutter_driver.dart';

import 'generic_finder.dart';

Future<bool> isDrawerLayout(FlutterDriver driver) async {
  bool foundDrawerBtn = await isElementExist(
      driver, find.byTooltip('Open navigation menu'),
      targetName: 'drawer layout');
  return foundDrawerBtn;
}

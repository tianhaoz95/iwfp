import 'package:flutter_driver/flutter_driver.dart';
import 'package:logger/logger.dart';

Future<bool> isElementExist(
    FlutterDriver driver, SerializableFinder finder, Logger logger,
    {String targetName = 'Unknown'}) async {
  try {
    await driver.waitFor(finder, timeout: Duration(seconds: 10));
    logger.d('Found the ${targetName} element.');
    return true;
  } catch (err) {
    logger.d('The ${targetName} element not found.');
    return false;
  }
}

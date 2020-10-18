import 'package:flutter_driver/flutter_driver.dart';
import 'package:logger/logger.dart';

Future<void> maybeTap(
    FlutterDriver driver, SerializableFinder finder, Logger logger) async {
  try {
    await driver.tap(finder, timeout: Duration(seconds: 10));
    return true;
  } catch (err) {
    logger.d('Tap failed.');
  }
}

import 'package:flutter_driver/flutter_driver.dart';

Future<bool> isElementExist(FlutterDriver driver, SerializableFinder finder,
    {String targetName = 'Unknown'}) async {
  try {
    await driver.waitFor(finder, timeout: Duration(seconds: 10));
    print('Found the ${targetName}.');
    return true;
  } catch (err) {
    print('The ${targetName} not found.');
    return false;
  }
}

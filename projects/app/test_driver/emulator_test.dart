import 'package:flutter_driver/flutter_driver.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';
import 'routine/main_routine.dart';

void main() {
  group('iwfpapp', () {
    FlutterDriver driver;
    Logger logger;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      logger = Logger();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('smoke test', () async {
      await smokeTestRoutine(driver, logger);
    }, timeout: Timeout(Duration(seconds: 300)));
  });
}

import 'package:flutter_driver/flutter_driver.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';
import 'routine/main_routine.dart';

class DriverFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

void main() {
  group('iwfpapp', () {
    FlutterDriver driver;
    Logger logger;

    setUpAll(() async {
      logger = Logger(filter: DriverFilter());
      driver = await FlutterDriver.connect();
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

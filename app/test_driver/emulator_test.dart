import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'routine/main_routine.dart';

void main() {
  group('iwfpapp', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('smoke test', () async {
      await smokeTestRoutine(driver);
    }, timeout: Timeout(Duration(seconds: 300)));
  });
}

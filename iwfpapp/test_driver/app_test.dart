// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('iwfpapp', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final shopNavBtn = find.byValueKey('shop_nav_btn');
    final cardsNavBtn = find.byValueKey('cards_nav_btn');
    final userNavBtn = find.byValueKey('user_nav_btn');
    final contribNavBtn = find.byValueKey('contrib_nav_btn');
    final guestLoginBtn = find.byValueKey('guest_login_btn');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('smoke test', () async {
      await driver.tap(guestLoginBtn);
      await driver.tap(cardsNavBtn);
      await driver.tap(userNavBtn);
      await driver.tap(contribNavBtn);
      await driver.tap(shopNavBtn);
    });
  });
}

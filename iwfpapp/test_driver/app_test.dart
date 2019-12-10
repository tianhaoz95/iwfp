// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'utilities/screenshot.dart';

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

    Future<bool> isSignedIn() async {
      try {
        await driver.waitFor(find.text('Shop Now!'),
            timeout: Duration(seconds: 3));
        return true;
      } catch (err) {
        return false;
      }
    }

    test('smoke test', () async {
      await prepareScreenshotArea();
      bool signedIn = await isSignedIn();
      if (signedIn) {
        await driver.tap(find.byValueKey('user_nav_btn'));
        await driver.waitFor(find.text('Go to Authentication'));
        await driver.tap(find.text('Go to Authentication'));
        await driver.waitFor(find.text('Logout'));
        await driver.tap(find.text('Logout'));
        await driver.waitFor(find.text('Sign In with Email'));
      }
      await takeNamedScreenshot(driver, 'sign_in_screen_pending');
      await driver.tap(find.byValueKey('sign_in_email_input'));
      await driver.enterText('tianhaoz@umich.edu');
      await driver.tap(find.byValueKey('sign_in_password_input'));
      await driver.enterText('Iwfpapp#950903');
      await takeNamedScreenshot(driver, 'sign_in_screen_presubmit');
      await driver.tap(find.text('Sign In with Email'));
      await driver.waitFor(find.byValueKey('shop_title'));
      await takeNamedScreenshot(driver, 'home_screen');
      await driver.tap(find.byValueKey('cards_nav_btn'));
      await driver.waitFor(find.byValueKey('cards_title'));
      await driver.tap(find.byValueKey('user_nav_btn'));
      await driver.waitFor(find.byValueKey('user_title'));
      await driver.tap(find.byValueKey('contrib_nav_btn'));
      await driver.waitFor(find.byValueKey('contrib_title'));
      await driver.tap(find.byValueKey('shop_nav_btn'));
    });
  });
}

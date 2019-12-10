// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'utilities/screenshot.dart';

void main() {
  group('iwfpapp', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final signInEmailInput = find.byValueKey('sign_in_email_input');
    final signInPasswordInput = find.byValueKey('sign_in_password_input');
    final shopNavBtn = find.byValueKey('shop_nav_btn');
    final cardsNavBtn = find.byValueKey('cards_nav_btn');
    final userNavBtn = find.byValueKey('user_nav_btn');
    final contribNavBtn = find.byValueKey('contrib_nav_btn');
    final emailSignInBtn = find.byValueKey('email_sign_in_btn');

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

    Future<bool> isSignedIn() async {
      try {
        await driver.waitFor(find.text('Shop Now!'),timeout: Duration(seconds: 3));
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
      await driver.tap(signInEmailInput);
      await driver.enterText('tianhaoz@umich.edu');
      await driver.tap(signInPasswordInput);
      await driver.enterText('Iwfpapp#950903');
      await takeNamedScreenshot(driver, 'sign_in_screen_presubmit');
      await driver.tap(emailSignInBtn);
      await driver.waitFor(find.text('Shop Now!'));
      await takeNamedScreenshot(driver, 'home_screen');
      await driver.tap(cardsNavBtn);
      await driver.tap(userNavBtn);
      await driver.tap(contribNavBtn);
      await driver.tap(shopNavBtn);
    });
  });
}

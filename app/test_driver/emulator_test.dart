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
        await driver.waitFor(find.byValueKey('shop_title'),
            timeout: Duration(seconds: 20));
        print('Found shop now title, the app is signed in.');
        return true;
      } catch (err) {
        print('Shop now title not found, the app is not signed in.');
        return false;
      }
    }

    test('smoke test', () async {
      await prepareScreenshotArea();
      bool signedIn = await isSignedIn();
      if (signedIn) {
        await driver.tap(find.byValueKey('user_nav_btn'));
        await driver.waitFor(find.text('Sign out'));
        await driver.tap(find.text('Sign out'));
        await driver.waitFor(find.text('Logout'));
        await driver.tap(find.text('Logout'));
        await driver.waitFor(find.text('Sign In with Email'));
      }
      await takeNamedScreenshot(driver, 'sign_in_screen_pending_offline');
      await driver.tap(find.byValueKey('sign_in_email_input'));
      await driver.enterText('tianhaoz@umich.edu');
      await driver.tap(find.byValueKey('sign_in_password_input'));
      await driver.enterText('250250abc');
      await takeNamedScreenshot(driver, 'sign_in_screen_presubmit_offline');
      await driver.tap(find.text('Sign In with Email'));
      await driver.waitFor(find.byValueKey('shop_title'));
      await takeNamedScreenshot(driver, 'shop_screen_offline');
      await driver.tap(find.byValueKey('cards_nav_btn'));
      await driver.waitFor(find.byValueKey('cards_title'));
      await takeNamedScreenshot(driver, 'card_management_screen_offline');
      await driver.tap(find.byValueKey('user_nav_btn'));
      await driver.waitFor(find.text('Dangerous Zone'));
      await takeNamedScreenshot(driver, 'user_settings_screen_offline');
      await driver.tap(find.byValueKey('contrib_nav_btn'));
      await driver.waitFor(find.byValueKey('contrib_title'));
      await takeNamedScreenshot(driver, 'contrib_screen_offline');
      await driver.tap(find.byValueKey('shop_nav_btn'));
      await driver.waitFor(find.byValueKey('shop_title'));
      await driver
          .tap(find.byValueKey('empty_wallet_jump_to_card_management_btn'));
      await driver.waitFor(find.byValueKey('cards_title'));
      await driver.tap(find.byValueKey('add_card_floating_btn'));
      await driver.waitFor(find.byValueKey('add_card_title'));
      await takeNamedScreenshot(driver, 'add_card_screen_offline');
      await driver.tap(find.byValueKey('go_to_add_card_from_template_btn'));
      await driver.waitFor(find.byValueKey('add_card_from_template_title'));
      await takeNamedScreenshot(
          driver, 'add_card_from_template_screen_offline');
      await driver.tap(find.byValueKey('discover_it_cashback_debit_add_btn'));
      await driver.waitFor(
          find.byValueKey('add_card_template_success_confirmation'),
          timeout: Duration(seconds: 30));
      await takeNamedScreenshot(
          driver, 'add_card_from_template_success_screen_offline');
      await driver.tap(find.byValueKey('add_template_success_nav_btn'));
      await driver.waitFor(find.byValueKey('cards_title'));
    }, timeout: Timeout(Duration(seconds: 300)));
  });
}

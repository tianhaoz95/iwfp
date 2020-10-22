import 'package:flutter_driver/flutter_driver.dart';
import 'package:logger/logger.dart';
import '../utilities/is_drawer_layout.dart';
import '../utilities/is_signed_in.dart';
import '../utilities/screenshot.dart';
import 'goto_home_tab.dart';

Future<void> smokeTestRoutine(FlutterDriver driver, Logger logger) async {
  logger.d('Start smoke test.');
  await prepareScreenshotArea();
  bool signedIn = await isSignedIn(driver);
  bool drawerLayout = await isDrawerLayout(driver, logger);
  if (signedIn) {
    logger.d('Signed in. Proceed to sign out.');
    await gotoHomeTab(driver, drawerLayout, 'user_nav_btn', logger);
    await driver.waitFor(find.byValueKey('go_to_auth_btn'));
    await driver.tap(find.byValueKey('go_to_auth_btn'));
    await driver.waitFor(find.byValueKey('logout_btn'));
    await driver.tap(find.byValueKey('logout_btn'));
    await driver.waitFor(find.byValueKey('email_sign_in_btn'));
    logger.d('Signed out.');
  } else {
    logger.d('Not signed in. Proceed.');
  }
  await takeNamedScreenshot(driver, 'sign_in_screen_pending_offline');
  await driver.tap(find.byValueKey('sign_in_email_input'));
  await driver.enterText('test@test.com');
  await driver.tap(find.byValueKey('sign_in_password_input'));
  await driver.enterText('123456');
  await takeNamedScreenshot(driver, 'sign_in_screen_presubmit_offline');
  await driver.scrollUntilVisible(
      find.byValueKey('sign_in_form'), find.byValueKey('email_sign_in_btn'));
  await driver.tap(find.byValueKey('email_sign_in_btn'));
  await driver.waitFor(find.byValueKey('go_to_home_btn'));
  await driver.tap(find.byValueKey('go_to_home_btn'));
  await driver.waitFor(find.byValueKey('home_screen_appbar'));
  await takeNamedScreenshot(driver, 'shop_screen_offline');
  await gotoHomeTab(driver, drawerLayout, 'cards_nav_btn', logger);
  await takeNamedScreenshot(driver, 'card_management_screen_offline');
  await gotoHomeTab(driver, drawerLayout, 'user_nav_btn', logger);
  await takeNamedScreenshot(driver, 'user_settings_screen_offline');
  await gotoHomeTab(driver, drawerLayout, 'contrib_nav_btn', logger);
  await takeNamedScreenshot(driver, 'contrib_screen_offline');
  await gotoHomeTab(driver, drawerLayout, 'cards_nav_btn', logger);
  await driver.tap(find.byValueKey('add_card_floating_btn'));
  await driver.waitFor(find.byValueKey('add_card_title'));
  await takeNamedScreenshot(driver, 'add_card_screen_offline');
  await driver.tap(find.byValueKey('go_to_add_card_from_template_btn'));
  await driver.waitFor(find.byValueKey('add_card_from_template_title'));
  await takeNamedScreenshot(driver, 'add_card_from_template_screen_offline');
  await driver.tap(find.byValueKey('discover_it_cashback_debit_add_btn'));
  await driver.waitFor(
      find.byValueKey('add_card_template_success_confirmation'),
      timeout: Duration(seconds: 30));
  await takeNamedScreenshot(
      driver, 'add_card_from_template_success_screen_offline');
  await driver.waitFor(find.byValueKey('home_screen_appbar'));
}

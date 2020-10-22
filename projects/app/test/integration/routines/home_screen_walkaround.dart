import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import '../validators/card_screen_validator.dart';

Future<void> homeScreenWalkaround(WidgetTester tester, Logger logger) async {
  logger.d('Validate home screen content before walking around home screen.');
  validateHomeScreenContent();
  logger.d('Home screen content validated, start walking through home screen.');
  await tester.tap(find.byKey(Key('cards_nav_btn')));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Key('contrib_nav_btn')));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Key('user_nav_btn')));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Key('shop_nav_btn')));
  await tester.pumpAndSettle();
  logger.d('Validate home screen content after walking around home screen.');
  validateHomeScreenContent();
  logger.d('Home screen content validated.');
  print('Home screen walkaround finished.');
}

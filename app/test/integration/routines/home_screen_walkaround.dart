import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/async_settlement.dart';
import '../validators/card_screen_validator.dart';

Future<void> homeScreenWalkaround(WidgetTester tester) async {
  await settleAsyncUpdate(tester);
  validateHomeScreenContent();
  await tester.tap(find.byKey(Key('cards_nav_btn')));
  await settleAsyncUpdate(tester);
  await tester.tap(find.byKey(Key('contrib_nav_btn')));
  await settleAsyncUpdate(tester);
  await tester.tap(find.byKey(Key('user_nav_btn')));
  await settleAsyncUpdate(tester);
  await tester.tap(find.byKey(Key('shop_nav_btn')));
  await settleAsyncUpdate(tester);
  validateHomeScreenContent();
  print('Home screen walkaround finished.');
}

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/async_settlement.dart';

Future<void> signOutAndSignIn(WidgetTester tester) async {
  await settleAsyncUpdate(tester);
  await tester.tap(find.byKey(Key('user_nav_btn')));
  await settleAsyncUpdate(tester);
  await tester.tap(find.byKey(Key('go_to_auth_btn')));
}

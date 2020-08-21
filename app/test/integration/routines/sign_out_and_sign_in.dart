import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> signOutAndSignIn(WidgetTester tester) async {
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Key('user_nav_btn')));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(Key('go_to_auth_btn')));
  await tester.pumpAndSettle();
  expect(find.byKey(Key('logout_btn')), findsOneWidget);
  await tester.tap(find.byKey(Key('logout_btn')));
  await tester.pumpAndSettle();
  expect(find.byKey(Key('email_sign_in_btn')), findsOneWidget);
  await tester.enterText(
      find.byKey(Key('sign_in_email_input')), 'test@test.com');
  await tester.enterText(find.byKey(Key('sign_in_password_input')), '123456');
  await tester.tap(find.byKey(Key('email_sign_in_btn')));
  await tester.pumpAndSettle();
  expect(find.byKey(Key('go_to_home_btn')), findsOneWidget);
  await tester.tap(find.byKey(Key('go_to_home_btn')));
  await tester.pumpAndSettle(Duration(seconds: 3));
}

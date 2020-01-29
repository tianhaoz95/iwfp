import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/app.dart';
import 'package:iwfpapp/services/context.dart';
import 'package:iwfpapp/services/data_store/base.dart';
import 'validators/screen_validator.dart';
import 'package:iwfpapp/services/auth.dart';
import 'mock_services/mock_context.dart';
import 'mock_services/mock_data_store.dart';
import 'mock_services/mock_auth.dart';

void main() {
  testWidgets('smoke test walk through', (WidgetTester tester) async {
    DataBackend mockDataBackend = MockDataBackend();
    IwfpappAuth mockAuth = MockIwfpappAuth();
    AppContext mockedAppContext = MockAppContext();
    await tester
        .pumpWidget(IwfpApp(mockDataBackend, mockAuth, mockedAppContext));
    await tester.pump();
    await tester.pumpAndSettle(new Duration(seconds: 5));
    await tester.enterText(
        find.byKey(Key('sign_in_email_input')), 'test_acct_0@iwfp.com');
    await tester.pumpAndSettle();
    await tester.enterText(
        find.byKey(Key('sign_in_password_input')), 'Test0%12345');
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('email_sign_in_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    await tester.tap(find.byKey(Key('chase_pay_select_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateSuggestionScreenContent();
    await tester.tap(find.byKey(Key('suggestion_back_btn')));
    await tester.pump(new Duration(seconds: 5));
    await tester.pump();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('cards_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateIsCardsScreenContent();
    await tester.tap(find.byKey(Key('contrib_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle();
    validateIsContribScreenContent();
    await tester.tap(find.byKey(Key('shop_nav_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateIsShopScreenContent();
    await tester.tap(find.byKey(Key('user_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle();
    validateIsUserScreenContent();
    await tester.tap(find.byKey(Key('go_to_auth_btn')));
    await tester.pump();
    await tester.pumpAndSettle();
    validateIsLoginScreenContent();
  });
}

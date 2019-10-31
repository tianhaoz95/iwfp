import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iwfpapp/main.dart';
import 'screen_validator.dart';

void validateIsLoginScreen() {
  expect(find.byKey(Key('iwfp_splash_img')), findsOneWidget);
}

void validateIsShopScreen() {
  expect(find.byKey(Key('shop_title')), findsOneWidget);
}

void validateIsCardsScreen() {
  expect(find.byKey(Key('cards_title')), findsOneWidget);
}

void validateIsUserScreen() {
  expect(find.byKey(Key('user_title')), findsOneWidget);
}

void validateIsContribScreen() {
  expect(find.byKey(Key('contrib_title')), findsOneWidget);
}

void validateIsPlaceholderScreen() {
  expect(find.byKey(Key('placeholder_title')), findsOneWidget);
}

void main() {
  testWidgets('smoke test walk through', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    // So far only guest login is supported.
    validateLoginScreenContent();
    await tester.tap(find.byKey(Key('guest_login_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateIsShopScreen();
    // Select one category and confirm it navigates
    // to the suggestions screen.
    await tester.tap(find.byKey(Key('samsung_pay_select_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateSuggestionScreenContent();
    await tester.pageBack();
    await tester.pump(new Duration(seconds: 5));
    await tester.pump();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('cards_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateIsCardsScreen();
    await tester.tap(find.byKey(Key('user_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle();
    validateIsUserScreen();
    await tester.tap(find.byKey(Key('contrib_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle();
    validateIsContribScreen();
    await tester.tap(find.byKey(Key('shop_nav_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateIsShopScreen();
    await tester.pageBack();
    await tester.pump();
    await tester.pumpAndSettle();
    validateIsLoginScreen();
  });
}

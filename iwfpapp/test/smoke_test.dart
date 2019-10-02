import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iwfpapp/main.dart';

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

void main() {
  testWidgets('smoke test walk through', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    validateIsShopScreen();
    await tester.tap(find.byKey(Key('cards_nav_btn')));
    await tester.pump();
    validateIsCardsScreen();
    await tester.tap(find.byKey(Key('user_nav_btn')));
    await tester.pump();
    validateIsUserScreen();
    await tester.tap(find.byKey(Key('contrib_nav_btn')));
    await tester.pump();
    validateIsContribScreen();
    await tester.tap(find.byKey(Key('shop_nav_btn')));
    await tester.pump();
    validateIsShopScreen();
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/services/mode.dart';
import 'package:iwfpapp/main.dart';
import 'package:mockito/mockito.dart';
import 'screen_validator.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/auth.dart';
import './mock_mode.dart';

class MockDataStore extends Mock implements DataStore {}

class MockIwfpappAuth extends Mock implements IwfpappAuth {}

void main() {
  testWidgets('smoke test walk through', (WidgetTester tester) async {
    DataStore mockDataStore = MockDataStore();
    IwfpappAuth mockAuth = MockIwfpappAuth();
    RunningMode mockMode = MockRunningMode();
    when(mockAuth.isSignedIn()).thenAnswer((_) => Future.value(false));
    await tester.pumpWidget(MyApp(mockDataStore, mockAuth, mockMode));
    await tester.pump();
    await tester.pumpAndSettle(new Duration(seconds: 5));
    // So far only guest login is supported.
    validateLoginScreenContent();
    await tester.tap(find.byKey(Key('guest_login_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateIsShopScreenContent();
    // Select one category and confirm it navigates
    // to the suggestions screen.
    await tester.tap(find.byKey(Key('chase_pay_select_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateSuggestionScreenContent();
    await tester.pageBack();
    await tester.pump(new Duration(seconds: 5));
    await tester.pump();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('cards_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateIsCardsScreenContent();
    await tester.tap(find.byKey(Key('user_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle();
    validateIsUserScreenContent();
    await tester.tap(find.byKey(Key('contrib_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle();
    validateIsContribScreenContent();
    await tester.tap(find.byKey(Key('shop_nav_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    validateIsShopScreenContent();
    await tester.pageBack();
    await tester.pump();
    await tester.pumpAndSettle();
    validateIsLoginScreenContent();
  });
}

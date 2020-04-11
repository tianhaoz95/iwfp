import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void validateShopScreenContent() {
  expect(find.byKey(Key('suggested_categories')), findsOneWidget);
}

void validateSuggestionScreenContent() {
  expect(find.byKey(Key('suggestion_title')), findsOneWidget);
}

void validateLoginScreenContent() {
  expect(find.byKey(Key('login_screen')), findsOneWidget);
}

void validateSignInFailedContent() {
  expect(find.byKey(Key('sign_in_failed_prompt')), findsOneWidget);
}

void validateIsShopScreenContent() {
  expect(find.byKey(Key('shop_title')), findsOneWidget);
}

void validateIsCardsScreenContent() {
  expect(find.byKey(Key('cards_title')), findsOneWidget);
}

void validateIsUserScreenContent() {
  expect(find.byKey(Key('user_title')), findsOneWidget);
}

void validateIsContribScreenContent() {
  expect(find.byKey(Key('contrib_title')), findsOneWidget);
}

void validateIsPlaceholderScreenContent() {
  expect(find.byKey(Key('placeholder_title')), findsOneWidget);
}

void validateIsSignInScreenContent() {
  expect(find.text('email'), findsOneWidget);
  expect(find.text('password'), findsOneWidget);
  expect(find.text('Sign In with Email'), findsOneWidget);
  expect(find.text('Forgot Password'), findsOneWidget);
  expect(find.text('Continue as Guest'), findsOneWidget);
  expect(find.text('Register'), findsOneWidget);
  expect(find.text('Welcome'), findsOneWidget);
}

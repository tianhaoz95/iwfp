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

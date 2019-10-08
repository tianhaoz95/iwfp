import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void validateShopScreenContent() {
  expect(find.byKey(Key('suggested_categories')), findsOneWidget);
}
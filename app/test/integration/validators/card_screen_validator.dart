import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void validateHomeScreenContent() {
  expect(find.byKey(Key('home_screen_appbar')), findsOneWidget);
  expect(find.byKey(Key('home_screen_bottom_nav_bar')), findsOneWidget);
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iwfpapp/screens/suggestion/main.dart';
import 'screen_validator.dart';

void main() {
  testWidgets('test contrib widget render no crash',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone contrib widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SuggestionScreen(),
    ));
    validateSuggestionScreenContent();
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iwfpapp/main.dart';

void main() {
  testWidgets('test app render no crash', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}

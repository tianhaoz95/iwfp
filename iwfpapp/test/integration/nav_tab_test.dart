import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iwfpapp/nav.dart';

void main() {
  testWidgets('test app render no crash', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      title: 'stand-alone contrib widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DestView(),
    ));
    await tester.pump(new Duration(seconds: 5));
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}

import 'package:flutter_test/flutter_test.dart';

Future<void> settleAsyncUpdate(WidgetTester tester) async {
  await tester.pump();
  await tester.pumpAndSettle(new Duration(seconds: 3));
  await tester.pumpAndSettle();
}

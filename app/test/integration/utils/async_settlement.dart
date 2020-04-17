import 'package:flutter_test/flutter_test.dart';

Future<void> settleAsyncUpdate(WidgetTester tester,
    {bool extraWait = true}) async {
  await tester.pump();
  if (extraWait) {
    await tester.pumpAndSettle(new Duration(seconds: 3));
  }
  await tester.pumpAndSettle();
}

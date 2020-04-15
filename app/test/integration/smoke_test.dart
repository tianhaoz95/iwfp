import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/app/app.dart';
import 'package:iwfpapp/services/app_auth/auth_factory.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';
import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/data_backend/data_backend_factory.dart';
import 'package:provider/provider.dart';
import 'validators/screen_validator.dart';

void main() {
  testWidgets('smoke test walk through', (WidgetTester tester) async {
    await tester
        .pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getAppAuth(AppAuthType.MOCK_AUTH)),
        ChangeNotifierProvider(create: (context) => getDataBackend(BackendType.MOCK)),
        ChangeNotifierProvider(create: (context) => AppContext()),
      ],
      child: IwfpApp(),
    ));
    await tester.pump();
    await tester.pumpAndSettle(new Duration(seconds: 5));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('cards_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle(new Duration(seconds: 5));
    // validateIsCardsScreenContent();
    await tester.tap(find.byKey(Key('contrib_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle();
    // validateIsContribScreenContent();
    await tester.tap(find.byKey(Key('shop_nav_btn')));
    await tester.pumpAndSettle(new Duration(seconds: 5));
    // validateIsShopScreenContent();
    await tester.tap(find.byKey(Key('user_nav_btn')));
    await tester.pump();
    await tester.pumpAndSettle();
    // validateIsUserScreenContent();
  });
}

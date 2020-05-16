import 'package:flutter_test/flutter_test.dart';
import 'package:iwfpapp/app/app.dart';
import 'package:iwfpapp/services/app_auth/auth_factory.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';
import 'package:iwfpapp/services/config/typedefs/app_theme_types.dart';
import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/data_backend/data_backend_factory.dart';
import 'package:iwfpapp/services/theme/theme_provider_factory.dart';
import 'package:provider/provider.dart';
import 'routines/home_screen_walkaround.dart';
import 'routines/sign_out_and_sign_in.dart';

void main() {
  testWidgets('smoke test walk through', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => getAppTheme(AppThemeType.MOCK)),
        ChangeNotifierProvider(
            create: (context) => getAppAuth(AppAuthType.MOCK_AUTH)),
        ChangeNotifierProvider(
            create: (context) => getDataBackend(BackendType.MOCK)),
        ChangeNotifierProvider(create: (context) => AppContext(allowDynamicLink: false)),
      ],
      child: IwfpApp(),
    ));
    print('before pumping');
    await tester.pump();
    await tester.pumpAndSettle(Duration(seconds: 3));
    await tester.pumpAndSettle();
    print('start sign out');
    await signOutAndSignIn(tester);
    await homeScreenWalkaround(tester);
  });
}

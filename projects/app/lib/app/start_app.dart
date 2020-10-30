import 'package:flutter/widgets.dart';
import 'package:iwfpapp/app/app.dart';
import 'package:iwfpapp/services/app_auth/auth_factory.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/app_context/app_context_factory.dart';
import 'package:iwfpapp/services/app_context/base_app_context.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';
import 'package:iwfpapp/services/config/typedefs/app_context_types.dart';
import 'package:iwfpapp/services/config/typedefs/app_theme_types.dart';
import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/data_backend/data_backend_factory.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:iwfpapp/services/theme/theme_provider_factory.dart';
import 'package:provider/provider.dart';

void startApp({
  AppAuthType appAuthType = AppAuthType.FIREBASE_AUTH,
  BackendType backendType = BackendType.HTTP,
  AppThemeType appThemeType = AppThemeType.OFFLINE,
  AppContextType appContextType = AppContextType.PROD,
  bool shouldReportDevCrashes = true,
  bool allowDynamicLink = true,
}) {
  WidgetsFlutterBinding.ensureInitialized();
  AppContext appContext =
      getAppContext(appContextType, allowDynamicLink: allowDynamicLink);
  AppAuth appAuth = getAppAuth(appAuthType);
  AppTheme appTheme = getAppTheme(appThemeType);
  DataBackend dataBackend = getDataBackend(backendType);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => appTheme),
        ChangeNotifierProvider(create: (context) => appAuth),
        ChangeNotifierProvider(create: (context) => dataBackend),
        ChangeNotifierProvider(create: (context) => appContext),
      ],
      child: IwfpApp(),
    ),
  );
}

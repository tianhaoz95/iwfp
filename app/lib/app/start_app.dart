import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/app/app.dart';
import 'package:iwfpapp/services/app_auth/auth_factory.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';
import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/data_backend/data_backend_factory.dart';
import 'package:provider/provider.dart';

void startApp({
  AppAuthType appAuthType = AppAuthType.FIREBASE_AUTH,
  BackendType backendType = BackendType.IN_APP,
  bool shouldReportDevCrashes = true,
}) {
  WidgetsFlutterBinding.ensureInitialized();
  if (shouldReportDevCrashes) {
    Crashlytics.instance.enableInDevMode = true;
  }
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  AppContext appContext = AppContext();
  AppAuth appAuth = getAppAuth(appAuthType);
  DataBackend dataBackend = getDataBackend(backendType);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => appAuth),
        ChangeNotifierProvider(create: (context) => dataBackend),
        ChangeNotifierProvider(create: (context) => appContext),
      ],
      child: IwfpApp(),
    ),
  );
}
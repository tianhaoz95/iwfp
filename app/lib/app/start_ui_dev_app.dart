import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/app/ui_dev_app.dart';
import 'package:iwfpapp/services/app_auth/auth_factory.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';
import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/data_backend/data_backend_factory.dart';
import 'package:provider/provider.dart';

void startUiDevApp() {
  WidgetsFlutterBinding.ensureInitialized();
  AppContext appContext = AppContext();
  AppAuth appAuth = getAppAuth(AppAuthType.DUMB_AUTH);
  DataBackend dataBackend = getDataBackend(BackendType.DUMB);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => appAuth),
        ChangeNotifierProvider(create: (context) => dataBackend),
        ChangeNotifierProvider(create: (context) => appContext),
      ],
      child: FivePercentUiDevApp(),
    ),
  );
}

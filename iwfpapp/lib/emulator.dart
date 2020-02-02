import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:iwfpapp/app.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/app_auth/factory.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';
import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/data_backend/factory.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  AppAuth auth = getAppAuth(AppAuthType.FIREBASE_AUTH);
  AppContext appContext = AppContext(emulator: true);
  DataBackend dataBackend =
      getDataBackend(BackendType.IN_APP, appContext, auth);
  runApp(IwfpApp(dataBackend, auth, appContext));
}

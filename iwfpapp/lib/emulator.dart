import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:iwfpapp/app.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/services/mode.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  RunningMode mode = RunningMode(emulator: true);
  DataStore dataStore = DataStore('firebase', mode);
  IwfpappAuth auth = IwfpappAuth(mode);
  runApp(IwfpApp(dataStore, auth, mode));
}

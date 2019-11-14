import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:iwfpapp/nav.dart';
import 'package:iwfpapp/screens/placeholder/main.dart';
import 'package:iwfpapp/screens/login/main.dart';
import 'package:iwfpapp/screens/suggestion/main.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/screens/add_card/main.dart';
import 'package:iwfpapp/screens/remove_card/main.dart';
import 'package:iwfpapp/screens/edit_card/main.dart';
import 'package:iwfpapp/services/mode.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  // DataStore is the top level data model
  DataStore dataStore = DataStore('firebase');

  // Authentication interface
  IwfpappAuth auth = IwfpappAuth();

  // Running mode interface
  RunningMode mode = RunningMode();

  runApp(MyApp(dataStore, auth, mode));
}

class MyApp extends StatelessWidget {
  final DataStore dataStore;
  final IwfpappAuth auth;
  final RunningMode mode;
  const MyApp(this.dataStore, this.auth, this.mode);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iwfp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(auth, mode),
        '/main': (context) => DestView(mode, dataStore),
        '/placeholder': (context) => PlaceholderScreen(),
        '/suggestion': (context) => SuggestionScreen(),
        '/add_card': (context) => AddCardScreen(dataStore),
        '/remove_card': (context) => RemoveCardScreen(dataStore),
        '/edit_card': (context) => EditCardScreen(),
      },
    );
  }
}

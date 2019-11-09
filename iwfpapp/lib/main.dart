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

  IwfpappAuth auth = IwfpappAuth();

  runApp(MyApp(dataStore, auth));
}

class MyApp extends StatelessWidget {
  final DataStore dataStore;
  final IwfpappAuth auth;
  const MyApp(this.dataStore, this.auth);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iwfp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(auth),
        '/main': (context) => DestView(),
        '/placeholder': (context) => PlaceholderScreen(),
        '/suggestion': (context) => SuggestionScreen(),
        '/add_card': (context) => AddCardScreen(),
        '/remove_card': (context) => RemoveCardScreen(),
        '/edit_card': (context) => EditCardScreen(),
      },
    );
  }
}

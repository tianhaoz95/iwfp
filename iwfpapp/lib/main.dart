import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:iwfpapp/screens/add_card_from_template/main.dart';
import 'package:iwfpapp/screens/delete_account/main.dart';
import 'package:iwfpapp/screens/home/main.dart';
import 'package:iwfpapp/screens/placeholder/main.dart';
import 'package:iwfpapp/screens/login/main.dart';
import 'package:iwfpapp/screens/remove_promo/main.dart';
import 'package:iwfpapp/screens/screen_tester/main.dart';
import 'package:iwfpapp/screens/sign_up/main.dart';
import 'package:iwfpapp/screens/suggestion/main.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/screens/add_card/main.dart';
import 'package:iwfpapp/screens/remove_card/main.dart';
import 'package:iwfpapp/screens/edit_card/main.dart';
import 'package:iwfpapp/services/mode.dart';
import 'package:iwfpapp/screens/add_promo/main.dart';
import 'package:iwfpapp/services/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set `enableInDevMode` to true to see reports while in debug mode
  // This is only to be used for confirming that reports are being
  // submitted as expected. It is not intended to be used for everyday
  // development.
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  // Running mode interface
  RunningMode mode = RunningMode();

  // DataStore is the top level data model
  DataStore dataStore = DataStore('firebase', mode);

  // Authentication interface
  IwfpappAuth auth = IwfpappAuth();

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
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(mode, dataStore, auth),
        '/sign_in': (context) => LoginScreen(auth, mode, dataStore),
        '/sign_up': (context) => SignUpScreen(auth),
        '/placeholder': (context) => PlaceholderScreen(),
        '/suggestion': (context) => SuggestionScreen(dataStore),
        '/add_card': (context) => AddCardScreen(dataStore),
        '/add_card_from_template': (context) =>
            AddCardFromTemplateScreen(dataStore),
        '/remove_card': (context) => RemoveCardScreen(dataStore),
        '/edit_card': (context) => EditCardScreen(),
        '/add_promo': (context) => AddPromoScreen(dataStore),
        '/remove_promo': (context) => RemovePromoScreen(dataStore),
        '/delete_account': (context) => DeleteAccountScreen(dataStore, auth),
        '/screen_tester': (context) => ScreenTester(),
      },
    );
  }
}

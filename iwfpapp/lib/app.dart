import 'package:flutter/material.dart';
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

class IwfpApp extends StatelessWidget {
  final DataStore dataStore;
  final IwfpappAuth auth;
  final RunningMode mode;
  const IwfpApp(this.dataStore, this.auth, this.mode);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iwfp',
      theme: theme,
      debugShowCheckedModeBanner: false,
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

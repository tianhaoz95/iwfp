import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_card_from_template/main.dart';
import 'package:iwfpapp/screens/delete_account/main.dart';
import 'package:iwfpapp/screens/forgot_password/main.dart';
import 'package:iwfpapp/screens/home/main.dart';
import 'package:iwfpapp/screens/placeholder/main.dart';
import 'package:iwfpapp/screens/login/main.dart';
import 'package:iwfpapp/screens/remove_promo/main.dart';
import 'package:iwfpapp/screens/screen_tester/main.dart';
import 'package:iwfpapp/screens/sign_up/main.dart';
import 'package:iwfpapp/screens/suggestion/main.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/screens/add_card/main.dart';
import 'package:iwfpapp/screens/remove_card/main.dart';
import 'package:iwfpapp/screens/edit_card/main.dart';
import 'package:iwfpapp/services/context.dart';
import 'package:iwfpapp/screens/add_promo/main.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/theme.dart';

class IwfpApp extends StatelessWidget {
  final DataBackend dataBackend;
  final AppAuth auth;
  final AppContext appContext;
  const IwfpApp(this.dataBackend, this.auth, this.appContext);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iwfp',
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(appContext, dataBackend, auth),
        '/sign_in': (context) => LoginScreen(auth, appContext, dataBackend),
        '/sign_up': (context) => SignUpScreen(auth),
        '/placeholder': (context) => PlaceholderScreen(),
        '/suggestion': (context) => SuggestionScreen(dataBackend),
        '/add_card': (context) => AddCardScreen(dataBackend),
        '/add_card_from_template': (context) =>
            AddCardFromTemplateScreen(dataBackend),
        '/remove_card': (context) => RemoveCardScreen(dataBackend),
        '/edit_card': (context) => EditCardScreen(),
        '/add_promo': (context) => AddPromoScreen(dataBackend),
        '/remove_promo': (context) => RemovePromoScreen(dataBackend),
        '/delete_account': (context) => DeleteAccountScreen(dataBackend, auth),
        '/screen_tester': (context) => ScreenTester(),
        '/forgot_password': (context) => ForgotPasswordScreen(auth),
      },
    );
  }
}

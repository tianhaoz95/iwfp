import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_card_from_template/main.dart';
import 'package:iwfpapp/screens/delete_account/main.dart';
import 'package:iwfpapp/screens/forgot_password/forgot_password_screen.dart';
import 'package:iwfpapp/screens/home/main.dart';
import 'package:iwfpapp/screens/placeholder/main.dart';
import 'package:iwfpapp/screens/auth/auth_screen.dart';
import 'package:iwfpapp/screens/remove_promo/main.dart';
import 'package:iwfpapp/screens/screen_tester/main.dart';
import 'package:iwfpapp/screens/sign_up/sign_up_screen.dart';
import 'package:iwfpapp/screens/suggestion/main.dart';
import 'package:iwfpapp/screens/add_card/add_card_screen.dart';
import 'package:iwfpapp/screens/remove_card/main.dart';
import 'package:iwfpapp/screens/edit_card/main.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/screens/add_promo/main.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/config/themes/default.dart';

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
        '/': (context) => HomeScreen(),
        '/sign_in': (context) => LoginScreen(),
        '/sign_up': (context) => SignUpScreen(),
        '/placeholder': (context) => PlaceholderScreen(),
        '/suggestion': (context) => SuggestionScreen(),
        '/add_card': (context) => AddCardScreen(dataBackend),
        '/add_card_from_template': (context) =>
            AddCardFromTemplateScreen(dataBackend),
        '/remove_card': (context) => RemoveCardScreen(dataBackend),
        '/edit_card': (context) => EditCardScreen(),
        '/add_promo': (context) => AddPromoScreen(dataBackend),
        '/remove_promo': (context) => RemovePromoScreen(dataBackend),
        '/delete_account': (context) => DeleteAccountScreen(dataBackend, auth),
        '/screen_tester': (context) => ScreenTester(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}

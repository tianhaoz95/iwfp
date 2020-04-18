import 'package:flutter/material.dart';
import 'package:iwfpapp/app/theme.dart';
import 'package:iwfpapp/screens/add_card_from_template/add_card_from_template_screen.dart';
import 'package:iwfpapp/screens/add_promo/add_promo_screen.dart';
import 'package:iwfpapp/screens/catalog/catalog_screen.dart';
import 'package:iwfpapp/screens/delete_account/delete_account_screen.dart';
import 'package:iwfpapp/screens/edit_card/edit_card_screen.dart';
import 'package:iwfpapp/screens/forgot_password/forgot_password_screen.dart';
import 'package:iwfpapp/screens/home/main.dart';
import 'package:iwfpapp/screens/placeholder/main.dart';
import 'package:iwfpapp/screens/auth/auth_screen.dart';
import 'package:iwfpapp/screens/remove_card/remove_card_screen.dart';
import 'package:iwfpapp/screens/remove_promo/remove_promo_screen.dart';
import 'package:iwfpapp/screens/sign_up/sign_up_screen.dart';
import 'package:iwfpapp/screens/suggestion/main.dart';
import 'package:iwfpapp/screens/add_card/add_card_screen.dart';

class FivePercentUiDevApp extends StatelessWidget {
  const FivePercentUiDevApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '5% App',
      theme: theme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => CatalogScreen(),
        '/home': (context) => HomeScreen(
              autoAuthCheck: false,
              autoRefresh: false,
            ),
        '/sign_in': (context) => LoginScreen(),
        '/sign_up': (context) => SignUpScreen(),
        '/placeholder': (context) => PlaceholderScreen(),
        '/suggestion': (context) => SuggestionScreen(),
        '/add_card': (context) => AddCardScreen(
              autoNav: false,
            ),
        '/add_card_from_template': (context) => AddCardFromTemplateScreen(
              autoNav: false,
              popNav: true,
              autoRefresh: false,
            ),
        '/remove_card': (context) => RemoveCardScreen(
              autoNav: false,
            ),
        '/edit_card': (context) => EditCardScreen(
              autoRefresh: false,
            ),
        '/add_promo': (context) => AddPromoScreen(
              autoNav: false,
            ),
        '/remove_promo': (context) => RemovePromoScreen(autoNav: false,),
        '/delete_account': (context) => DeleteAccountScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}

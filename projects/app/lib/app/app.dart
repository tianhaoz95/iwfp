import 'dart:typed_data';

import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_card_from_template/add_card_from_template_screen.dart';
import 'package:iwfpapp/screens/add_promo/add_promo_screen.dart';
import 'package:iwfpapp/screens/delete_account/delete_account_screen.dart';
import 'package:iwfpapp/screens/edit_card/edit_card_screen.dart';
import 'package:iwfpapp/screens/error/error_screen_with_recover_route.dart';
import 'package:iwfpapp/screens/forgot_password/forgot_password_screen.dart';
import 'package:iwfpapp/screens/home/home_screen.dart';
import 'package:iwfpapp/screens/placeholder/main.dart';
import 'package:iwfpapp/screens/auth/auth_screen.dart';
import 'package:iwfpapp/screens/remove_card/remove_card_screen.dart';
import 'package:iwfpapp/screens/remove_promo/remove_promo_screen.dart';
import 'package:iwfpapp/screens/sign_up/sign_up_screen.dart';
import 'package:iwfpapp/screens/splash/splash_screen.dart';
import 'package:iwfpapp/screens/suggestion/main.dart';
import 'package:iwfpapp/screens/add_card/add_card_screen.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:provider/provider.dart';

class IwfpApp extends StatelessWidget {
  const IwfpApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (BuildContext context, AppTheme theme, Widget child) {
        return BetterFeedback(
            onFeedback: (BuildContext context, String feedback,
                Uint8List feedbackScreenshot) {
              print('Feedback detected');
              BetterFeedback.of(context).hide();
            },
            child: MaterialApp(
              title: '5% App',
              theme: theme.getLightTheme(),
              darkTheme: theme.getDarkTheme(),
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => SplashScreen(),
                '/home': (context) => HomeScreen(),
                '/sign_in': (context) => LoginScreen(),
                '/sign_up': (context) => SignUpScreen(),
                '/placeholder': (context) => PlaceholderScreen(),
                '/suggestion': (context) => SuggestionScreen(),
                '/add_card': (context) => AddCardScreen(),
                '/add_card_from_template': (context) =>
                    AddCardFromTemplateScreen(),
                '/remove_card': (context) => RemoveCardScreen(),
                '/edit_card': (context) => EditCardScreen(),
                '/add_promo': (context) => AddPromoScreen(),
                '/remove_promo': (context) => RemovePromoScreen(),
                '/delete_account': (context) => DeleteAccountScreen(),
                '/forgot_password': (context) => ForgotPasswordScreen(),
                '/error_screen_with_recover_route': (context) =>
                    ErrorScreenWithRecoverRoute(),
              },
            ));
      },
    );
  }
}

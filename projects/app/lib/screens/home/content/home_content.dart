import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/cards/card_management_screen.dart';
import 'package:iwfpapp/screens/home/content/contrib/main.dart';
import 'package:iwfpapp/screens/home/content/shop/shopping_screen.dart';
import 'package:iwfpapp/screens/home/content/user/main.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';

/// home screen
///
/// {@category Screens}
class HomeScreenContent extends StatelessWidget {
  final HomeTabId id;
  const HomeScreenContent(this.id);

  @override
  Widget build(BuildContext context) {
    switch (this.id) {
      case HomeTabId.SHOPPING:
        return ShopNow();
      case HomeTabId.CARD_MANAGEMENT:
        return ManageCard();
      case HomeTabId.USER_SETTINGS:
        return UserSettings();
      case HomeTabId.CONTRIB:
        return Contrib();
      default:
        return ShopNow();
    }
  }
}

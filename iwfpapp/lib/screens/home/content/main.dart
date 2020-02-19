import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/cards/main.dart';
import 'package:iwfpapp/screens/home/content/contrib/main.dart';
import 'package:iwfpapp/screens/home/content/shop/main.dart';
import 'package:iwfpapp/screens/home/content/user/main.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/data_backend/base.dart';

class HomeScreenContent extends StatelessWidget {
  final HomeTabId id;
  final SubmitScreenStatus status;
  final DataBackend dataBackend;
  final AppContext appContext;
  final AppAuth appAuth;
  final List<CreditCard> cards;
  final List<ShopCategory> categories;
  const HomeScreenContent(this.id, this.dataBackend, this.appContext,
      this.appAuth, this.cards, this.categories, this.status);

  @override
  Widget build(BuildContext context) {
    if (this.status == SubmitScreenStatus.LOADING) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      switch (this.id) {
        case HomeTabId.SHOPPING:
          return ShopNow(this.categories);
        case HomeTabId.CARD_MANAGEMENT:
          return ManageCard(this.dataBackend);
        case HomeTabId.USER_SETTINGS:
          return UserSettings(this.appContext, this.appAuth);
        case HomeTabId.CONTRIB:
          return Contrib();
        default:
          return ShopNow(this.categories);
      }
    }
  }
}

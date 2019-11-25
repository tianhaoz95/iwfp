import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';

const Map<HomeTabId, HomeTab> homeTabs = {
  HomeTabId.SHOPPING: HomeTab('Shop Now!', Icons.shopping_cart, Colors.teal,
      Key('shop_nav_btn'), Key('shop_title')),
  HomeTabId.CARD_MANAGEMENT: HomeTab('Manage Cards', Icons.credit_card,
      Colors.cyan, Key('cards_nav_btn'), Key('cards_title')),
  HomeTabId.USER_SETTINGS: HomeTab('My Settings', Icons.account_circle,
      Colors.orange, Key('user_nav_btn'), Key('user_title')),
  HomeTabId.CONTRIB: HomeTab('Contribute', Icons.favorite, Colors.blue,
      Key('contrib_nav_btn'), Key('contrib_title')),
};

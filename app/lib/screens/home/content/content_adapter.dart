import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/home_content.dart';
import 'package:iwfpapp/screens/home/content/vertical_menu.dart';
import 'package:iwfpapp/services/config/typedefs/home_screen_mode.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';

class HomeScreenContentAdapter extends StatelessWidget {
  final HomeScreenMode mode;
  final Map<HomeTabId, HomeTab> tabs;
  final HomeTabId currentTabId;
  final OnTabTappedHandler onTabTappedHandler;

  const HomeScreenContentAdapter(
      {Key key,
      @required this.tabs,
      @required this.currentTabId,
      @required this.onTabTappedHandler,
      @required this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (this.mode) {
      case HomeScreenMode.BOTTOM_NAV:
        return SafeArea(
            bottom: true, child: HomeScreenContent(this.currentTabId));
      case HomeScreenMode.TWO_COL:
        return Container(
          child: Row(
            children: [
              SizedBox(
                width: 300.0,
                child: VerticalHomeMenu(
                  currentTabId: this.currentTabId,
                  mode: this.mode,
                  onTabTappedHandler: this.onTabTappedHandler,
                  tabs: this.tabs,
                ),
              ),
              VerticalDivider(
                thickness: 1.0,
              ),
              Expanded(
                child: HomeScreenContent(this.currentTabId),
              ),
            ],
          ),
        );
      case HomeScreenMode.DRAWER:
        return HomeScreenContent(this.currentTabId);
      default:
        return SafeArea(
            bottom: true, child: HomeScreenContent(this.currentTabId));
    }
  }
}

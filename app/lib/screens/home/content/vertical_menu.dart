import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_screen_mode.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

typedef void OnTabTappedHandler(int index, {bool shouldPop});

class VerticalHomeMenu extends StatelessWidget {
  final HomeScreenMode mode;
  final Map<HomeTabId, HomeTab> tabs;
  final HomeTabId currentTabId;
  final OnTabTappedHandler onTabTappedHandler;
  const VerticalHomeMenu(
      {Key key,
      @required this.tabs,
      @required this.currentTabId,
      @required this.onTabTappedHandler,
      @required this.mode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 25.0,
        ),
        ListViewItem(
          child: Image(
            image:
                AssetImage('assets/auth_screen_subtitle_high_resolution.png'),
          ),
        ),
        Divider(
          thickness: 1.0,
        ),
        ListViewItem(
          child: FlatButton(
              onPressed: () {
                this.onTabTappedHandler(0,
                    shouldPop: mode == HomeScreenMode.DRAWER);
              },
              child: Container(
                  child: Row(
                children: [
                  Icon(this.tabs[HomeTabId.SHOPPING].icon),
                  SizedBox(
                    width: 25.0,
                  ),
                  Text(this.tabs[HomeTabId.SHOPPING].title),
                ],
              ))),
        ),
        Divider(
          thickness: 1.0,
        ),
        ListViewItem(
          child: FlatButton(
              onPressed: () {
                this.onTabTappedHandler(1,
                    shouldPop: mode == HomeScreenMode.DRAWER);
              },
              child: Container(
                  child: Row(
                children: [
                  Icon(this.tabs[HomeTabId.CARD_MANAGEMENT].icon),
                  SizedBox(
                    width: 25.0,
                  ),
                  Text(this.tabs[HomeTabId.CARD_MANAGEMENT].title),
                ],
              ))),
        ),
        Divider(
          thickness: 1.0,
        ),
        ListViewItem(
          child: FlatButton(
              onPressed: () {
                this.onTabTappedHandler(2,
                    shouldPop: mode == HomeScreenMode.DRAWER);
              },
              child: Container(
                  child: Row(
                children: [
                  Icon(this.tabs[HomeTabId.USER_SETTINGS].icon),
                  SizedBox(
                    width: 25.0,
                  ),
                  Text(this.tabs[HomeTabId.USER_SETTINGS].title),
                ],
              ))),
        ),
        Divider(
          thickness: 1.0,
        ),
        ListViewItem(
          child: FlatButton(
              onPressed: () {
                this.onTabTappedHandler(3,
                    shouldPop: mode == HomeScreenMode.DRAWER);
              },
              child: Container(
                  child: Row(
                children: [
                  Icon(this.tabs[HomeTabId.CONTRIB].icon),
                  SizedBox(
                    width: 25.0,
                  ),
                  Text(this.tabs[HomeTabId.CONTRIB].title),
                ],
              ))),
        ),
        Divider(
          thickness: 1.0,
        ),
      ],
    );
  }
}

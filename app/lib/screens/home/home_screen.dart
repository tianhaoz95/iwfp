import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/screens/home/content/bottom_nav.dart';
import 'package:iwfpapp/screens/home/content/content_adapter.dart';
import 'package:iwfpapp/screens/home/content/vertical_menu.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/config/consts/home_tabs.dart';
import 'package:iwfpapp/services/config/typedefs/home_screen_mode.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final bool autoAuthCheck;
  final bool autoRefresh;
  const HomeScreen(
      {Key key, this.autoAuthCheck = true, this.autoRefresh = true})
      : super(key: key);
  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  Map<HomeTabId, HomeTab> tabs;
  HomeTabId currentTabId = HomeTabId.SHOPPING;

  @override
  void initState() {
    super.initState();
    this.tabs = homeTabs;
    currentTabId = HomeTabId.SHOPPING;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      currentTabId = ModalRoute.of(context).settings.arguments;
    }
    if (widget.autoAuthCheck) {
      maybeNavigateToSignIn();
    }
    if (widget.autoRefresh) {
      Provider.of<DataBackend>(context, listen: false).maybeRefresh();
    }
  }

  Future<void> maybeNavigateToSignIn() async {
    bool signedIn = await Provider.of<AppAuth>(context).isSignedIn();
    if (!signedIn) {
      Navigator.of(context).pushReplacementNamed('/sign_in');
    }
  }

  void onTabTapped(int index, {bool shouldPop = false}) {
    setState(() {
      currentTabId = homeTabIndex2Id(index);
    });
    if (shouldPop) {
      Navigator.pop(context);
    }
  }

  Widget renderActionBtn(BuildContext context) {
    if (currentTabId == HomeTabId.CARD_MANAGEMENT) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_card');
        },
        key: Key('add_card_floating_btn'),
        child: Icon(Icons.add),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    HomeScreenMode mode = HomeScreenMode.BOTTOM_NAV;
    double avaialbeWidth = MediaQuery.of(context).size.width;
    double avaialbeHeight = MediaQuery.of(context).size.height;
    if (avaialbeWidth >= PreferredWidth + 300.0 && avaialbeHeight >= 500.0) {
      mode = HomeScreenMode.TWO_COL;
    }
    if (avaialbeHeight < 500.0) {
      mode = HomeScreenMode.DRAWER;
    }
    return Scaffold(
      appBar: AppBar(
        key: Key('home_screen_appbar'),
        title: Text('5% App'),
        actions: [
          ButtonTheme(
              minWidth: 25.0,
              child: FlatButton(
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                onPressed: () {
                  Provider.of<DataBackend>(context, listen: false)
                      .forceRefresh();
                },
              ))
        ],
      ),
      drawer: (mode == HomeScreenMode.DRAWER)
          ? Drawer(
              child: VerticalHomeMenu(
                  tabs: this.tabs,
                  currentTabId: this.currentTabId,
                  onTabTappedHandler: this.onTabTapped,
                  mode: mode),
            )
          : null,
      body: HomeScreenContentAdapter(
        currentTabId: this.currentTabId,
        mode: mode,
        onTabTappedHandler: this.onTabTapped,
        tabs: this.tabs,
      ),
      floatingActionButton: renderActionBtn(context),
      bottomNavigationBar: (mode == HomeScreenMode.BOTTOM_NAV)
          ? HomeBottomNavigator(this.tabs, this.currentTabId, this.onTabTapped)
          : null,
    );
  }
}

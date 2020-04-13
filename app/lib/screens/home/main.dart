import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/screens/home/bottom_nav.dart';
import 'package:iwfpapp/screens/home/content/main.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/config/consts/home_tabs.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    maybeNavigateToSignIn();
    Provider.of<DataBackend>(context, listen: false).maybeRefreshCards();
    currentTabId = HomeTabId.SHOPPING;
    if (ModalRoute.of(context).settings.arguments != null) {
      currentTabId = ModalRoute.of(context).settings.arguments;
    }
  }

  Future<void> maybeNavigateToSignIn() async {
    bool signedIn = await Provider.of<AppAuth>(context).isSignedIn();
    if (!signedIn) {
      Navigator.of(context).pushReplacementNamed('/sign_in');
    }
  }

  void onTabTapped(int index) {
    setState(() {
      currentTabId = homeTabIndex2Id(index);
    });
  }

  Widget renderActionBtn(BuildContext context) {
    if (currentTabId == HomeTabId.CARD_MANAGEMENT) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/add_card');
        },
        key: Key('add_card_floating_btn'),
        child: Icon(Icons.add),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                        .forceRefreshCards();
                  },
                ))
          ],
        ),
        body:
            SafeArea(bottom: true, child: HomeScreenContent(this.currentTabId)),
        floatingActionButton: renderActionBtn(context),
        bottomNavigationBar: HomeBottomNavigator(
            this.tabs, this.currentTabId, this.onTabTapped));
  }
}

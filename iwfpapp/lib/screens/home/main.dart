import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/screens/shop/main.dart';
import 'package:iwfpapp/screens/cards/main.dart';
import 'package:iwfpapp/screens/contrib/main.dart';
import 'package:iwfpapp/screens/user/main.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/services/config/consts/home_tabs.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/mode.dart';

const List<HomeTab> allDests = <HomeTab>[
  HomeTab('Shop Now!', Icons.shopping_cart, Colors.teal, Key('shop_nav_btn'),
      Key('shop_title')),
  HomeTab('Manage Cards', Icons.credit_card, Colors.cyan, Key('cards_nav_btn'),
      Key('cards_title')),
  HomeTab('My Settings', Icons.account_circle, Colors.orange,
      Key('user_nav_btn'), Key('user_title')),
  HomeTab('Contribute', Icons.favorite, Colors.blue, Key('contrib_nav_btn'),
      Key('contrib_title')),
];

class HomeScreen extends StatefulWidget {
  final RunningMode mode;
  final DataStore dataStore;
  final IwfpappAuth auth;
  const HomeScreen(this.mode, this.dataStore, this.auth, {Key key})
      : super(key: key);
  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  SubmitScreenStatus status = SubmitScreenStatus.LOADING;
  HomeTabId currentTabId = HomeTabId.SHOPPING;
  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    _children = [
      ShopNow(widget.dataStore),
      ManageCard(widget.dataStore),
      UserSettings(widget.mode),
      Contrib(),
    ];
    maybeNavigateToSignIn();
    widget.dataStore.fetchCards();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      currentTabId = ModalRoute.of(context).settings.arguments;
    } else {
      currentTabId = HomeTabId.SHOPPING;
    }
  }

  Future<void> maybeNavigateToSignIn() async {
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    bool signedIn = await widget.auth.isSignedIn();
    if (signedIn) {
      setState(() {
        status = SubmitScreenStatus.DONE;
      });
    } else {
      Navigator.of(context).pushReplacementNamed('/sign_in');
    }
  }

  void onTabTapped(int index) {
    setState(() {
      currentTabId = homeTabIndex2Id(index);
    });
  }

  Future<void> handleRefresh() async {
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    await widget.dataStore.forceRefresh();
    setState(() {
      status = SubmitScreenStatus.DONE;
    });
  }

  Widget renderActionBtn(BuildContext context) {
    if (currentTabId == HomeTabId.CARD_MANAGEMENT) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/add_card');
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      );
    }
    return null;
  }

  Widget renderLoading(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preparing ...'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget renderDone(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.mode.devifyString(homeTabs[currentTabId].title),
              key: homeTabs[currentTabId].titleKey),
          backgroundColor: homeTabs[currentTabId].color,
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.refresh, color: Colors.white,),
              onPressed: () async {
                await handleRefresh();
              },
            ),
          ],
        ),
        backgroundColor: homeTabs[currentTabId].color[100],
        body: SafeArea(
            bottom: true, child: _children[homeTabId2Index(currentTabId)]),
        floatingActionButton: renderActionBtn(context),
        bottomNavigationBar: BottomNavigationBar(
          key: Key('bottom_nav_bar'),
          onTap: onTabTapped,
          currentIndex: homeTabId2Index(currentTabId),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(homeTabs[HomeTabId.SHOPPING].icon,
                  key: homeTabs[HomeTabId.SHOPPING].btnKey),
              backgroundColor: homeTabs[HomeTabId.SHOPPING].color,
              title: Text(homeTabs[HomeTabId.SHOPPING].title),
            ),
            BottomNavigationBarItem(
              icon: Icon(homeTabs[HomeTabId.CARD_MANAGEMENT].icon,
                  key: homeTabs[HomeTabId.CARD_MANAGEMENT].btnKey),
              backgroundColor: homeTabs[HomeTabId.CARD_MANAGEMENT].color,
              title: Text(homeTabs[HomeTabId.CARD_MANAGEMENT].title),
            ),
            BottomNavigationBarItem(
              icon: Icon(homeTabs[HomeTabId.USER_SETTINGS].icon,
                  key: homeTabs[HomeTabId.USER_SETTINGS].btnKey),
              backgroundColor: homeTabs[HomeTabId.USER_SETTINGS].color,
              title: Text(homeTabs[HomeTabId.USER_SETTINGS].title),
            ),
            BottomNavigationBarItem(
              icon: Icon(homeTabs[HomeTabId.CONTRIB].icon,
                  key: homeTabs[HomeTabId.CONTRIB].btnKey),
              backgroundColor: homeTabs[HomeTabId.CONTRIB].color,
              title: Text(homeTabs[HomeTabId.CONTRIB].title),
            ),
          ],
        ));
  }

  Widget renderScreen(BuildContext context) {
    Widget screenContent = renderLoading(context);
    switch (status) {
      case SubmitScreenStatus.LOADING:
        screenContent = renderLoading(context);
        break;
      case SubmitScreenStatus.DONE:
        screenContent = renderDone(context);
        break;
      default:
        screenContent = renderLoading(context);
    }
    return screenContent;
  }

  @override
  Widget build(BuildContext context) {
    return renderScreen(context);
  }
}

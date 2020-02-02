import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/screens/shop/main.dart';
import 'package:iwfpapp/screens/cards/main.dart';
import 'package:iwfpapp/screens/contrib/main.dart';
import 'package:iwfpapp/screens/user/main.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/config/consts/home_tabs.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/data_backend/base.dart';

class HomeScreen extends StatefulWidget {
  final AppContext appContext;
  final DataBackend dataBackend;
  final AppAuth auth;
  const HomeScreen(this.appContext, this.dataBackend, this.auth, {Key key})
      : super(key: key);
  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  SubmitScreenStatus status = SubmitScreenStatus.LOADING;
  Map<HomeTabId, HomeTab> tabs = homeTabs;
  HomeTabId currentTabId = HomeTabId.SHOPPING;
  List<Widget> _children = [];
  List<CreditCard> cards = [];
  List<ShopCategory> categories = [];

  @override
  void initState() {
    super.initState();
    _children = [
      ShopNow(widget.dataBackend),
      ManageCard(widget.dataBackend),
      UserSettings(widget.appContext),
      Contrib(),
    ];
    tabs[HomeTabId.SHOPPING].onRefresh = this.handleRefresh;
    tabs[HomeTabId.CARD_MANAGEMENT].onRefresh = this.handleRefresh;
    maybeNavigateToSignIn();
    widget.dataBackend.forceRefreshCards();
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
    await widget.dataBackend.forceRefreshCards();
    List<CreditCard> refreshedCards = await widget.dataBackend.getCreditCards();
    List<ShopCategory> refershedCategories = await widget.dataBackend.getShopCategories();
    setState(() {
      cards = refreshedCards;
      categories = refershedCategories;
      status = SubmitScreenStatus.DONE;
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

  Widget renderLoading(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preparing ...'),
      ),
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
          title: Text(
              this.tabs[currentTabId].title,
              key: this.tabs[currentTabId].titleKey),
          actions: <Widget>[
            ButtonTheme(
                minWidth: 25.0,
                child: FlatButton(
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )),
            ButtonTheme(
                minWidth: 25.0,
                child: FlatButton(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )),
            ButtonTheme(
                minWidth: 25.0,
                child: FlatButton(
                  child: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    await handleRefresh();
                  },
                )),
          ],
        ),
        body: SafeArea(
            bottom: true, child: _children[homeTabId2Index(currentTabId)]),
        floatingActionButton: renderActionBtn(context),
        bottomNavigationBar: BottomNavigationBar(
          key: Key('bottom_nav_bar'),
          onTap: onTabTapped,
          currentIndex: homeTabId2Index(currentTabId),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(this.tabs[HomeTabId.SHOPPING].icon,
                  key: this.tabs[HomeTabId.SHOPPING].btnKey),
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(this.tabs[HomeTabId.SHOPPING].title),
            ),
            BottomNavigationBarItem(
              icon: Icon(this.tabs[HomeTabId.CARD_MANAGEMENT].icon,
                  key: this.tabs[HomeTabId.CARD_MANAGEMENT].btnKey),
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(this.tabs[HomeTabId.CARD_MANAGEMENT].title),
            ),
            BottomNavigationBarItem(
              icon: Icon(this.tabs[HomeTabId.USER_SETTINGS].icon,
                  key: this.tabs[HomeTabId.USER_SETTINGS].btnKey),
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(this.tabs[HomeTabId.USER_SETTINGS].title),
            ),
            BottomNavigationBarItem(
              icon: Icon(this.tabs[HomeTabId.CONTRIB].icon,
                  key: this.tabs[HomeTabId.CONTRIB].btnKey),
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(this.tabs[HomeTabId.CONTRIB].title),
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

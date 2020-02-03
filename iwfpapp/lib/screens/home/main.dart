import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/screens/home/appbar.dart';
import 'package:iwfpapp/screens/home/bottom_nav.dart';
import 'package:iwfpapp/screens/home/content/main.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/config/consts/home_tabs.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/config/typedefs/shopping_context.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/recommendation_engine/category_ranker.dart';

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
  List<CreditCard> cards = [];
  List<ShopCategory> categories = [];

  @override
  void initState() {
    super.initState();
    this.tabs = homeTabs;
    this.tabs[HomeTabId.SHOPPING].onRefresh = this.handleRefresh;
    this.tabs[HomeTabId.SHOPPING].onQueryChange = this.onShoppingQueryChange;
    this.tabs[HomeTabId.CARD_MANAGEMENT].onRefresh = this.handleRefresh;
    maybeNavigateToSignIn();
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
      await handleRefresh();
    } else {
      Navigator.of(context).pushReplacementNamed('/sign_in');
    }
  }

  void onTabTapped(int index) {
    setState(() {
      currentTabId = homeTabIndex2Id(index);
    });
  }

  Future<void> onShoppingQueryChange(String query) async {
    List<ShopCategory> rankedCategories =
        rankShopCategories(categories, ShoppingContext(query: query));
    setState(() {
      categories = rankedCategories;
    });
  }

  Future<void> handleRefresh() async {
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    await widget.dataBackend.forceRefreshCards();
    List<CreditCard> refreshedCards = await widget.dataBackend.getCreditCards();
    List<ShopCategory> refershedCategories =
        await widget.dataBackend.getShopCategories();
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
        appBar: PreferredSize(
            child: HomeAppBar(this.tabs[currentTabId]),
            preferredSize: Size.fromHeight(kToolbarHeight)),
        body: SafeArea(
            bottom: true,
            child: HomeScreenContent(this.currentTabId, widget.dataBackend,
                widget.appContext, widget.auth, this.cards, this.categories)),
        floatingActionButton: renderActionBtn(context),
        bottomNavigationBar: HomeBottomNavigator(
            this.tabs, this.currentTabId, this.onTabTapped));
  }

  Widget renderScreen(BuildContext context) {
    switch (status) {
      case SubmitScreenStatus.LOADING:
        return renderLoading(context);
      case SubmitScreenStatus.DONE:
        return renderDone(context);
      default:
        return renderLoading(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return renderScreen(context);
  }
}

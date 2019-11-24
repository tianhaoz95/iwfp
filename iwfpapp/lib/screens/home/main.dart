import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/screens/shop/main.dart';
import 'package:iwfpapp/screens/cards/main.dart';
import 'package:iwfpapp/screens/contrib/main.dart';
import 'package:iwfpapp/screens/user/main.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';
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
  const HomeScreen(this.mode, this.dataStore, {Key key}) : super(key: key);
  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> _children = [];
  final List<HomeTab> destinations = allDests;

  @override
  void initState() {
    super.initState();
    _children = [
      ShopNow(),
      ManageCard(widget.dataStore),
      UserSettings(widget.mode),
      Contrib(),
    ];
    widget.dataStore.fetchCards();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget renderActionBtn(BuildContext context) {
    if (_currentIndex == 1) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_card');
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              widget.mode.devifyString(destinations[_currentIndex].title),
              key: destinations[_currentIndex].titleKey),
          backgroundColor: destinations[_currentIndex].color,
        ),
        backgroundColor: destinations[_currentIndex].color[100],
        body: SafeArea(bottom: true, child: _children[_currentIndex]),
        floatingActionButton: renderActionBtn(context),
        bottomNavigationBar: BottomNavigationBar(
          key: Key('bottom_nav_bar'),
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: destinations.map((HomeTab destination) {
            return BottomNavigationBarItem(
                icon: Icon(destination.icon, key: destination.btnKey),
                backgroundColor: destination.color,
                title: Text(destination.title));
          }).toList(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'shop.dart';
import 'cards.dart';
import 'contrib.dart';
import 'user.dart';

class Dest {
  final String title;
  final IconData icon;
  final MaterialColor color;
  const Dest(this.title, this.icon, this.color);
}

const List<Dest> allDests = <Dest>[
  Dest('Shop Now!', Icons.shopping_cart, Colors.teal),
  Dest('Manage Cards', Icons.credit_card, Colors.cyan),
  Dest('My Settings', Icons.account_circle, Colors.orange),
  Dest('Contribute', Icons.favorite, Colors.blue),
];

class DestView extends StatefulWidget {
  const DestView({ Key key }) : super(key: key);

  @override
  _DestView createState() {
    return _DestView();
  }
}

class _DestView extends State<DestView> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ShopNow(),
    ManageCard(),
    UserSettings(),
    Contrib(),
  ];
  final List<Dest> destinations = allDests;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.destination.title'),
        backgroundColor: destinations[_currentIndex].color,
      ),
      // backgroundColor: widget.destination.color[100],
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: destinations.map((Dest destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            backgroundColor: destination.color,
            title: Text(destination.title)
          );
        }).toList(),
      )
    );
  }
}
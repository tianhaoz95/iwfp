import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/bottom_nav.dart';

class HomeScreenLayout extends StatelessWidget {
  final PreferredSize appBar;
  final Widget drawer;
  final Widget menu;
  final Widget body;
  final HomeBottomNavigator bottomNavigationBar;
  final FloatingActionButton floatingActionButton;
  const HomeScreenLayout(
      {this.appBar,
      this.drawer,
      this.menu,
      this.body,
      this.bottomNavigationBar,
      this.floatingActionButton});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1000.0) {
          double menuWidth = constraints.maxWidth * 0.2;
          return Scaffold(
            appBar: this.appBar,
            floatingActionButton: floatingActionButton,
            body: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: menuWidth,
                    child: this.menu,
                  ),
                  Container(
                    child: AspectRatio(
                      aspectRatio: 9.0 / 16.0,
                      child: this.menu,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: this.appBar,
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: this.bottomNavigationBar,
            body: Container(
              child: AspectRatio(
                aspectRatio: 9.0 / 16.0,
                child: this.body,
              ),
            ),
          );
        }
      },
    );
  }
}

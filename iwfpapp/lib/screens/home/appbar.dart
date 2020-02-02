import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';

class HomeAppBar extends StatefulWidget {
  final HomeTab tab;
  const HomeAppBar(this.tab);
  @override
  _HomeAppBar createState() {
    return _HomeAppBar();
  }
}

class _HomeAppBar extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.tab.title,
          key: widget.tab.titleKey),
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
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () async {},
            )),
      ],
    );
  }
}

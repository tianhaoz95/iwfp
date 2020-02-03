import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab.dart';

class HomeAppBar extends StatefulWidget {
  final HomeTab tab;
  HomeAppBar(this.tab);
  @override
  _HomeAppBar createState() {
    return _HomeAppBar();
  }
}

class _HomeAppBar extends State<HomeAppBar> {
  List<Widget> actions;
  bool query;

  List<Widget> gatherActions() {
    List<Widget> useActions = [];
    if (widget.tab.hasQueryHandler()) {
      useActions.add(ButtonTheme(
          minWidth: 25.0,
          child: FlatButton(
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                query = !query;
              });
            },
          )));
    }
    if (widget.tab.hasRefreshHandler()) {
      useActions.add(ButtonTheme(
          minWidth: 25.0,
          child: FlatButton(
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () async {
              await widget.tab.onRefresh();
            },
          )));
    }
    return useActions;
  }

  @override
  void initState() {
    super.initState();
    this.query = false;
    actions = this.gatherActions();
  }

  @override
  void didUpdateWidget(HomeAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    List<Widget> newActions = this.gatherActions();
    if (oldWidget.tab.id != widget.tab.id) {
      setState(() {
        query = false;
      });
    }
    setState(() {
      actions = newActions;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget titleContent = Text(widget.tab.title, key: widget.tab.titleKey);
    if (this.query) {
      titleContent = Container(
          child: TextField(
              onChanged: (query) {
                widget.tab.onQueryChange(query);
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.fromLTRB(10.0, 1.0, 1.0, 1.0),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)))));
    }
    return AppBar(
      title: titleContent,
      actions: this.actions,
    );
  }
}

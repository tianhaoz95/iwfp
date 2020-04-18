import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class CardRemoved extends StatefulWidget {
  final bool autoNav;

  const CardRemoved({Key key, this.autoNav = true}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CardRemoved();
  }
}

class _CardRemoved extends State<CardRemoved> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.autoNav) {
      navToWallet();
    }
  }

  Future<void> navToWallet() async {
    await Future.delayed(Duration(milliseconds: 200));
    Navigator.pushReplacementNamed(context, '/',
        arguments: HomeTabId.CARD_MANAGEMENT);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        ListViewItem(
          child: Center(
            child: Text('Card Removed'),
          ),
        )
      ],
    ));
  }
}

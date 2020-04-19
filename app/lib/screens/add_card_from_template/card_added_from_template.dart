import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class CardAddedFromTemplate extends StatefulWidget {
  final bool autoNav;

  const CardAddedFromTemplate({Key key, this.autoNav = true}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardAddedFromTemplate();
  }
}

class _CardAddedFromTemplate extends State<CardAddedFromTemplate> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.autoNav) {
      navToWallet();
    }
  }

  Future<void> navToWallet() async {
    await Future.delayed(Duration(milliseconds: 200));
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/',
        arguments: HomeTabId.CARD_MANAGEMENT);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListViewItem(
            child: Material(
              child: Card(
                child: Container(
                  child: Center(
                    child: Text('Card added from template'),
                  ),
                  key: Key('add_card_template_success_confirmation'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

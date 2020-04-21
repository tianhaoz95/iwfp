import 'package:flutter/material.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

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
    Provider.of<DataBackend>(context, listen: false).maybeRefresh();
    Navigator.pop(context);
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

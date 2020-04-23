import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';

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
    Provider.of<DataBackend>(context, listen: false).maybeRefresh();
    Navigator.pop(context);
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

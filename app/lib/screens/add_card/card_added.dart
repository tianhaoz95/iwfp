import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class AddCardScreenCardAddedContent extends StatefulWidget {
  final bool autoNav;

  const AddCardScreenCardAddedContent({Key key, this.autoNav = true})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _AddCardScreenCardAddedContent();
  }
}

class _AddCardScreenCardAddedContent
    extends State<AddCardScreenCardAddedContent> {
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
    Provider.of<DataBackend>(context, listen: false).maybeRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      child: ListView(
        children: <Widget>[
          ListViewItem(
              child: Center(
            child: Text('Add card succeeded!'),
          )),
        ],
      ),
    );
  }
}

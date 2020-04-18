import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/edit_card/edit_card_content.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';
import 'package:provider/provider.dart';

class EditCardScreen extends StatefulWidget {
  /// This is to control the behavior of refreshing the
  /// data (e.g. credit cards or credit card templates)
  /// when the enter card editor which is this screen.
  /// It is default to true which is the app behavior,
  /// but set to false while testing the UI because it
  /// will be much harder to debug the UI if it only
  /// flashes for a second.
  final bool autoRefresh;

  const EditCardScreen({Key key, this.autoRefresh = true}) : super(key: key);

  @override
  _EditCardScreen createState() {
    return _EditCardScreen();
  }
}

class _EditCardScreen extends State<EditCardScreen> {
  CreditCard card = CreditCard('Unknown', 'unknown');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      card = ModalRoute.of(context).settings.arguments;
    }
    if (widget.autoRefresh) {
      Provider.of<DataBackend>(context, listen: false).maybeRefresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Card'),
      ),
      body: PreferredWidthContent(
          child: EditCardContent(
        card: this.card,
      )),
    );
  }
}

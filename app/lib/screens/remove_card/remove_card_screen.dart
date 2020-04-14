import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/remove_card/remove_card_content.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

class RemoveCardScreen extends StatefulWidget {
  const RemoveCardScreen({Key key}) : super(key: key);
  @override
  _RemoveCardScreen createState() {
    return _RemoveCardScreen();
  }
}

class _RemoveCardScreen extends State<RemoveCardScreen> {
  CreditCard card = CreditCard('Unknown', 'unknown');
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      card = ModalRoute.of(context).settings.arguments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Card'),
      ),
      body: PreferredWidthContent(
          child: RemoveCardContent(
        card: this.card,
      )),
    );
  }
}

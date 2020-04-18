import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/remove_card/remove_card_content.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

class RemoveCardScreen extends StatefulWidget {
  /// This controls whether it will automatically navigate
  /// to the home screen once the card deletion is completed.
  /// It is default to true which is the expected app behavior.
  /// However, it is disabled in UI development since it is
  /// hard to debug if it navigates away in less a second.
  final bool autoNav;
  const RemoveCardScreen({Key key, this.autoNav = true}) : super(key: key);
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
        autoNav: widget.autoNav,
      )),
    );
  }
}

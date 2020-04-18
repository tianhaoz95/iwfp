import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_promo/add_promo_content.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

/// This screen prompts users to enter information
/// of a credit card promotion.
///
/// {@category Screens}
class AddPromoScreen extends StatefulWidget {
  final CreditCard defaultCard;
  final bool autoNav;
  const AddPromoScreen({Key key, this.defaultCard, this.autoNav = true})
      : super(key: key);
  @override
  _AddPromoScreen createState() {
    return _AddPromoScreen();
  }
}

class _AddPromoScreen extends State<AddPromoScreen> {
  CreditCard card;
  SubmitScreenStatus status = SubmitScreenStatus.PENDING;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      card = ModalRoute.of(context).settings.arguments;
    } else {
      if (widget.defaultCard != null) {
        card = widget.defaultCard;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Promotion'),
      ),
      body: PreferredWidthContent(
          child: AddPromoContent(
        card: this.card,
        autoNav: widget.autoNav,
      )),
    );
  }
}

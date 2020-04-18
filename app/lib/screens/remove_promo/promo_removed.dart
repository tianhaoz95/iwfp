import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';

class PromoRemoved extends StatefulWidget {
  final RemovePromoMeta removePromoMeta;

  /// see [RemovePromoScreen.autoNav]
  final bool autoNav;

  const PromoRemoved(
      {Key key, @required this.removePromoMeta, this.autoNav = true})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PromoRemoved();
  }
}

class _PromoRemoved extends State<PromoRemoved> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.autoNav) {
      navToEditCard();
    }
  }

  Future<void> navToEditCard() async {
    await Future.delayed(Duration(milliseconds: 200));
    CreditCard modifiedCard = widget.removePromoMeta.card;
    modifiedCard.removePromo(widget.removePromoMeta.promo);
    Navigator.pushReplacementNamed(context, '/edit_card',
        arguments: modifiedCard);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListViewItem(
            child: Material(
              child: Card(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          'Promotion removed',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

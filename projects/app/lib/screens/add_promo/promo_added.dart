import 'package:flutter/material.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:provider/provider.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';

class PromoAdded extends StatefulWidget {
  final CreditCard card;
  final bool autoNav;

  const PromoAdded({Key key, @required this.card, this.autoNav = true})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PromoAdded();
  }
}

class _PromoAdded extends State<PromoAdded> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.autoNav) {
      navToEditCard();
    }
  }

  Future<void> navToEditCard() async {
    await Future.delayed(Duration(milliseconds: 200));
    Provider.of<DataBackend>(context, listen: false).maybeRefresh();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Material(
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Promotion Added'),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

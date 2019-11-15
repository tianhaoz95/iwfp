import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwfpapp/services/credit_card.dart';

class AddPromoScreen extends StatefulWidget {
  @override
  _AddPromoScreen createState() {
    return _AddPromoScreen();
  }
}

class _AddPromoScreen extends State<AddPromoScreen> {
  CreditCard card;

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
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Add Promotion for ' + card.name),
      ),
    );
  }
}
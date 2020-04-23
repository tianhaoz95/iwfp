import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/inputs/add_card_id_input.dart';
import 'package:iwfpapp/widgets/inputs/add_card_name_input.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class AddCardScreenAddCardFormContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddCardScreenAddCardFormContent();
  }
}

class _AddCardScreenAddCardFormContent
    extends State<AddCardScreenAddCardFormContent> {
  TextEditingController cardIdInputCtrl;
  TextEditingController cardNameInputCtrl;

  @override
  void initState() {
    super.initState();
    this.cardIdInputCtrl = TextEditingController();
    this.cardNameInputCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: ListView(
        children: <Widget>[
          ListViewItem(
            child: AddCardIdInput(this.cardIdInputCtrl),
          ),
          ListViewItem(
            child: AddCardNameInput(this.cardNameInputCtrl),
          ),
          ListViewItem(
              child: RaisedButton(
            color: Colors.green,
            child: Text(
              'Add Card',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              Provider.of<DataBackend>(context, listen: false).initCreditCard(
                  CreditCardInitRequest(CreditCard(
                      cardNameInputCtrl.text, cardIdInputCtrl.text)));
            },
          )),
          ListViewItem(
              child: RaisedButton(
            color: Colors.amber[900],
            child: Text('From Template', style: TextStyle(color: Colors.white)),
            key: Key('go_to_add_card_from_template_btn'),
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/add_card_from_template');
            },
          )),
        ],
      ),
    );
  }
}

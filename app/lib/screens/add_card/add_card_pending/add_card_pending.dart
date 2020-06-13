import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_card/add_card_pending/add_card_id_input.dart';
import 'package:iwfpapp/screens/add_card/add_card_pending/add_card_name_input.dart';
import 'package:iwfpapp/screens/add_card/add_card_pending/add_card_official_url_input.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';
import 'package:iwfpapp/services/utilities/interface/creators.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class AddCardScreenAddCardPendingContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddCardScreenAddCardPendingContent();
  }
}

class _AddCardScreenAddCardPendingContent
    extends State<AddCardScreenAddCardPendingContent> {
  TextEditingController cardIdInputCtrl;
  TextEditingController cardNameInputCtrl;
  TextEditingController cardOfficialUrlInputCtrl;

  @override
  void initState() {
    super.initState();
    this.cardIdInputCtrl = TextEditingController();
    this.cardNameInputCtrl = TextEditingController();
    this.cardOfficialUrlInputCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 12.0,
          ),
          ListViewItem(
            child: AddCardIdInput(this.cardIdInputCtrl),
          ),
          ListViewItem(
            child: AddCardNameInput(this.cardNameInputCtrl),
          ),
          ListViewItem(
            child: AddCardOfficialUrlInput(this.cardOfficialUrlInputCtrl),
          ),
          ListViewItem(
              child: RaisedButton(
            color: Colors.green,
            child: Text(
              'Add Card',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              Provider.of<DataBackend>(context, listen: false)
                  .initCreditCard(createCreditCardCreationRequest(
                cardData: createCreditCard(
                  cardNameInputCtrl.text,
                  cardIdInputCtrl.text,
                  officialUrl: cardOfficialUrlInputCtrl.text,
                ),
              ));
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

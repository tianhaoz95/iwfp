import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/widgets/inputs/add_card_id_input.dart';
import 'package:iwfpapp/widgets/inputs/add_card_name_input.dart';

typedef Future<void> AddCardHandler();

class AddCardScreenAddCardFormContent extends StatelessWidget {
  final TextEditingController cardIdInputCtrl;
  final TextEditingController cardNameInputCtrl;
  final AddCardHandler addCardHandler;
  const AddCardScreenAddCardFormContent(
      {@required this.addCardHandler,
      @required this.cardIdInputCtrl,
      @required this.cardNameInputCtrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          AddCardIdInput(this.cardIdInputCtrl),
          SizedBox(height: 25.0),
          AddCardNameInput(this.cardNameInputCtrl),
          SizedBox(height: 25.0),
          RaisedButton(
            color: Colors.green,
            child: Text(
              'Add Card',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await this.addCardHandler();
            },
          ),
          RaisedButton(
            color: Colors.amber[900],
            child: Text('From Template', style: TextStyle(color: Colors.white)),
            key: Key('go_to_add_card_from_template_btn'),
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/add_card_from_template');
            },
          ),
          RaisedButton(
            color: Colors.redAccent,
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/',
                  arguments: HomeTabId.CARD_MANAGEMENT);
            },
          ),
        ],
      ),
    );
  }
}

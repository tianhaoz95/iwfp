import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/widgets/inputs/add_card_id_input.dart';
import 'package:iwfpapp/widgets/inputs/add_card_name_input.dart';
import 'package:iwfpapp/widgets/buttons/submit_add_card_btn.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key key}) : super(key: key);

  @override
  _AddCardScreen createState() {
    return _AddCardScreen();
  }
}

class _AddCardScreen extends State<AddCardScreen> {
  final TextEditingController cardIdInputCtrl = TextEditingController();
  final TextEditingController cardNameInputCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Add card'),
      ),
      backgroundColor: Colors.cyan[100],
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 25.0),
            AddCardIdInput(cardIdInputCtrl),
            SizedBox(height: 25.0),
            AddCardNameInput(cardNameInputCtrl),
            SizedBox(height: 25.0),
            SubmitAddCardButton(
              onPressedCallback: () {},
            ),
          ],
        ),
      ),
    );
  }
}

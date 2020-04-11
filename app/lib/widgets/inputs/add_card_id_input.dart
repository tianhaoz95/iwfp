import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCardIdInput extends StatelessWidget {
  final TextEditingController ctrl;
  const AddCardIdInput(this.ctrl);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
            controller: ctrl,
            key: Key('add_card_id_input'),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'ID of the credit card (must be unique)',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)))));
  }
}

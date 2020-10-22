import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCardNameInput extends StatelessWidget {
  final TextEditingController ctrl;
  const AddCardNameInput(this.ctrl);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
            controller: ctrl,
            key: Key('add_card_name_input'),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Name of the credit card',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)))));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCardOfficialUrlInput extends StatelessWidget {
  final TextEditingController ctrl;
  const AddCardOfficialUrlInput(this.ctrl);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
            controller: ctrl,
            key: Key('add_card_id_input'),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: '(Optional) Official website',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)))));
  }
}

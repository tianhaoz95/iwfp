import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';

class CardRemoved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Material(
        child: RaisedButton(
          color: Colors.green,
          child:
              Text('Done! Back to main', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/',
                arguments: HomeTabId.CARD_MANAGEMENT);
          },
        ),
      )),
    );
  }
}

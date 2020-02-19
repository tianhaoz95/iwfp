import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';

class EmptyWalletShoppingScreen extends StatelessWidget {
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
                      height: 5.0,
                    ),
                    Center(
                      child: Text('No shopping sector found'),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Center(
                      child: Text('Please consider adding cards'),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: RaisedButton(
                color: Colors.green,
                key: Key('empty_wallet_jump_to_card_management_btn'),
                child: Text(
                  'Go to card wallet',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/',
                      arguments: HomeTabId.CARD_MANAGEMENT);
                },
              ),
            ),
          ],
        ),
      );
  }
}
import 'package:flutter/material.dart';

/// card management screen with a empty wallet
///
/// {@category Screens}
/// {@subcategory CardManagementScreen}
class EmptyWalletCardScreen extends StatelessWidget {
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
                  child: Text('No Card Found'),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Center(
                  child: Text(
                    'Use the button below to add cards.',
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}

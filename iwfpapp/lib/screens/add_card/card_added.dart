import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';

class AddCardScreenCardAddedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Center(
            child: Text('Add card succeeded!'),
          ),
          SizedBox(
            height: 15.0,
          ),
          Material(
            child: RaisedButton(
              color: Colors.green,
              child: Text('Go to main menu',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/',
                    arguments: HomeTabId.CARD_MANAGEMENT);
              },
            ),
          )
        ],
      ),
    );
  }
}

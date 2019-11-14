import 'package:flutter/material.dart';
import 'package:iwfpapp/services/credit_card.dart';

class RemoveCardScreen extends StatefulWidget {
  @override
  _RemoveCardScreen createState() {
    return _RemoveCardScreen();
  }
}

class _RemoveCardScreen extends State<RemoveCardScreen> {
  CreditCard card = CreditCard('Unknown', 'unknown');
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      card = ModalRoute.of(context).settings.arguments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Card'),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan[100],
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Material(
              color: Colors.cyan[100],
              child: Card(
                color: Colors.cyan,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Center(
                        child: Text('Remove Credit Card',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Center(
                        child: Text('Card Name: ' + card.name,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child: Center(
                        child: Text('Card ID: ' + card.id,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Material(
                color: Colors.cyan[100],
                child: Container(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                  child: RaisedButton(
                    color: Colors.red,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child:
                          Text('Delete', style: TextStyle(color: Colors.white)),
                    ),
                    onPressed: () {},
                  ),
                )),
            Material(
                color: Colors.cyan[100],
                child: Container(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      child:
                          Text('Cancel', style: TextStyle(color: Colors.white)),
                    ),
                    onPressed: () {},
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

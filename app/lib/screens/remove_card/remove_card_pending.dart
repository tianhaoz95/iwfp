import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:provider/provider.dart';

class RemoveCardPending extends StatelessWidget {
  final CreditCard card;
  const RemoveCardPending({@required this.card});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Material(
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: Center(
                      child: Text('Removing Credit Card'),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: Center(
                      child: Text('${card.displayName} (${card.id})'),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: Center(
                      child: Text('Once removed, it cannot be recovered!'),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
          Material(
              child: Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              color: Colors.redAccent,
              child: Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                child: Text('Delete', style: TextStyle(color: Colors.white)),
              ),
              onPressed: () {
                Provider.of<DataBackend>(context, listen: false)
                    .removeCreditCard(CreditCardRemovalRequest(this.card.id));
              },
            ),
          )),
        ],
      ),
    );
  }
}

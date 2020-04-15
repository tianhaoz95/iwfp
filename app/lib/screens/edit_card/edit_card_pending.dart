import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/widgets/promos/entry_view.dart';
import 'package:provider/provider.dart';

class EditCardPending extends StatelessWidget {
  final String cardId;
  const EditCardPending({@required this.cardId});
  List<Widget> renderPromotions(CreditCard card) {
    if (card.promos.isEmpty) {
      return [Text('empty')];
    } else {
      return card.promos.map((promo) => PromoEntry(promo, card)).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(
      builder: (BuildContext context, DataBackend backend, Widget child) {
        CreditCard updatedCard = backend.queryCreditCard(this.cardId);
        List<Widget> promos = renderPromotions(updatedCard);
        List<Widget> contentList = [
          Material(
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                    child: Text('${updatedCard.name} (${updatedCard.id})'),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ];
        promos.forEach((Widget promo) {
          contentList.add(promo);
        });
        contentList.add(Container(
          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          child: RaisedButton(
            color: Colors.green,
            child: Text('Add Promotion', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/add_promo',
                  arguments: updatedCard);
            },
          ),
        ));
        contentList.add(Container(
          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          child: RaisedButton(
            color: Colors.amber[900],
            child: Text('Cancel', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/',
                  arguments: HomeTabId.CARD_MANAGEMENT);
            },
          ),
        ));
        return Container(
          child: ListView(
            children: contentList,
          ),
        );
      },
    );
  }
}

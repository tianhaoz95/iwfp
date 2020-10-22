import 'package:flutter/material.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/widgets/promos/entry_view/entry_view.dart';
import 'package:provider/provider.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

class EditCardPending extends StatelessWidget {
  final String cardId;
  const EditCardPending({@required this.cardId});
  Widget renderPromotions(CreditCard card) {
    if (card.promotions.isEmpty) {
      return Text('empty');
    } else {
      return PromoEntries(card);
    }
  }

  @override
  Widget build(BuildContext context) {
    CreditCard updatedCard = Provider.of<DataBackend>(context, listen: false)
        .queryCreditCard(this.cardId);
    return Container(
      child: PreferredWidthContent(
        child: ListView(
          children: <Widget>[
            Material(
              child: Card(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Text('${updatedCard.displayName}'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
            this.renderPromotions(updatedCard),
          ],
        ),
      ),
    );
  }
}

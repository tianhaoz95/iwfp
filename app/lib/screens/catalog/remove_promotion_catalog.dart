import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_getter.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class RemovePromotionCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListViewItem(
            child: Center(
              child: Text('Remove Promotion'),
            ),
          ),
          Divider(),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Pending'),
                  onPressed: () {
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).status = DataBackendStatus.AVAILABLE;
                    CreditCard target = getRandomCreditCardTemplate();
                    Navigator.pushNamed(context, '/remove_promo',
                        arguments:
                            RemovePromoMeta(target, target.promotions[0]));
                  }),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Loading'),
                  onPressed: () {
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).status = DataBackendStatus.LOADING;
                    CreditCard target = getRandomCreditCardTemplate();
                    Navigator.pushNamed(context, '/remove_promo',
                        arguments:
                            RemovePromoMeta(target, target.promotions[0]));
                  }),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Error'),
                  onPressed: () {
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).status = DataBackendStatus.ERROR;
                    CreditCard target = getRandomCreditCardTemplate();
                    Navigator.pushNamed(context, '/remove_promo',
                        arguments:
                            RemovePromoMeta(target, target.promotions[0]));
                  }),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Completed'),
                  onPressed: () {
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).status = DataBackendStatus.OUTDATED;
                    CreditCard target = getRandomCreditCardTemplate();
                    Navigator.pushNamed(context, '/remove_promo',
                        arguments:
                            RemovePromoMeta(target, target.promotions[0]));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

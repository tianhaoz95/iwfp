import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_getter.dart';
import 'package:iwfpapp/services/utilities/category_counter.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class RecommendationCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListViewItem(
            child: Center(
              child: Text('Recmomendations'),
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
                    List<CreditCard> cards = getLocalCreditCardTemplates();
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).creditCards = cards;
                    Navigator.pushNamed(context, '/suggestion',
                        arguments: getRandomShoppingCategories(cards));
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
                    List<CreditCard> cards = getLocalCreditCardTemplates();
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).creditCards = cards;
                    Navigator.pushNamed(context, '/suggestion',
                        arguments: getRandomShoppingCategories(cards));
                  }),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Outdated'),
                  onPressed: () {
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).status = DataBackendStatus.OUTDATED;
                    List<CreditCard> cards = getLocalCreditCardTemplates();
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).creditCards = cards;
                    Navigator.pushNamed(context, '/suggestion',
                        arguments: getRandomShoppingCategories(cards));
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
                    List<CreditCard> cards = getLocalCreditCardTemplates();
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).creditCards = cards;
                    Navigator.pushNamed(context, '/suggestion',
                        arguments: getRandomShoppingCategories(cards));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

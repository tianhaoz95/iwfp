import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/config/typedefs/auth_states.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_getter.dart';
import 'package:iwfpapp/services/utilities/category_counter.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Catalog'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            FlatButton(onPressed: () {}, child: Text('test'))
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            ListViewItem(
              child: Center(
                child: Text('Sign In'),
              ),
            ),
            Divider(),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Loading'),
                    onPressed: () {
                      Provider.of<AppAuth>(
                        context,
                        listen: false,
                      ).authState = AuthState.LOADING;
                      Navigator.pushNamed(context, '/sign_in');
                    }),
              ),
            ),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Error'),
                    onPressed: () {
                      Provider.of<AppAuth>(
                        context,
                        listen: false,
                      ).authState = AuthState.ERROR;
                      Navigator.pushNamed(context, '/sign_in');
                    }),
              ),
            ),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Success'),
                    onPressed: () {
                      Provider.of<AppAuth>(
                        context,
                        listen: false,
                      ).authState = AuthState.SIGNED_IN;
                      Navigator.pushNamed(context, '/sign_in');
                    }),
              ),
            ),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Pending'),
                    onPressed: () {
                      Provider.of<AppAuth>(
                        context,
                        listen: false,
                      ).authState = AuthState.NOT_SIGNED_IN;
                      Navigator.pushNamed(context, '/sign_in');
                    }),
              ),
            ),
            ListViewItem(
              child: Center(
                child: Text('Home'),
              ),
            ),
            Divider(),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Loading'),
                    onPressed: () {
                      Provider.of<DataBackend>(
                        context,
                        listen: false,
                      ).status = DataBackendStatus.LOADING;
                      Navigator.pushNamed(context, '/home');
                    }),
              ),
            ),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Available (Empty)'),
                    onPressed: () {
                      Provider.of<DataBackend>(
                        context,
                        listen: false,
                      ).status = DataBackendStatus.AVAILABLE;
                      Provider.of<DataBackend>(
                        context,
                        listen: false,
                      ).creditCards = [];
                      Navigator.pushNamed(context, '/home');
                    }),
              ),
            ),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Available'),
                    onPressed: () {
                      Provider.of<DataBackend>(
                        context,
                        listen: false,
                      ).status = DataBackendStatus.AVAILABLE;
                      Provider.of<DataBackend>(
                        context,
                        listen: false,
                      ).creditCards = getLocalCreditCardTemplates();
                      Navigator.pushNamed(context, '/home');
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
                      Navigator.pushNamed(context, '/home');
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
                      Navigator.pushNamed(context, '/home');
                    }),
              ),
            ),
            ListViewItem(
              child: Center(
                child: Text('Placeholder'),
              ),
            ),
            Divider(),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Pending'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/placeholder');
                    }),
              ),
            ),
            ListViewItem(
              child: Center(
                child: Text('Edit Card'),
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
                      List<CreditCard> cardTemplates =
                          getLocalCreditCardTemplates();
                      Provider.of<DataBackend>(
                        context,
                        listen: false,
                      ).creditCards = cardTemplates;
                      Navigator.pushNamed(context, '/edit_card',
                          arguments: getRandomCreditCardTemplate());
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
                      Navigator.pushNamed(context, '/edit_card');
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
                      Navigator.pushNamed(context, '/edit_card');
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
                      Navigator.pushNamed(context, '/edit_card');
                    }),
              ),
            ),
            ListViewItem(
              child: Center(
                child: Text('Remove Card'),
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
                      List<CreditCard> cardTemplates =
                          getLocalCreditCardTemplates();
                      Provider.of<DataBackend>(
                        context,
                        listen: false,
                      ).creditCards = cardTemplates;
                      Navigator.pushNamed(context, '/remove_card',
                          arguments: getRandomCreditCardTemplate());
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
                      Navigator.pushNamed(context, '/remove_card');
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
                      Navigator.pushNamed(context, '/remove_card');
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
                      Navigator.pushNamed(context, '/remove_card');
                    }),
              ),
            ),
            ListViewItem(
              child: Center(
                child: Text('Add Promotion'),
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
                      Navigator.pushNamed(context, '/add_promo',
                          arguments: getRandomCreditCardTemplate());
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
                      Navigator.pushNamed(context, '/add_promo',
                          arguments: getRandomCreditCardTemplate());
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
                      Navigator.pushNamed(context, '/add_promo',
                          arguments: getRandomCreditCardTemplate());
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
                      Navigator.pushNamed(context, '/add_promo',
                          arguments: getRandomCreditCardTemplate());
                    }),
              ),
            ),
            ListViewItem(
              child: Center(
                child: Text('Add Card'),
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
                      Navigator.pushNamed(context, '/add_card');
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
                      Navigator.pushNamed(context, '/add_card');
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
                      Navigator.pushNamed(context, '/add_card');
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
                      Navigator.pushNamed(context, '/add_card');
                    }),
              ),
            ),
            ListViewItem(
              child: Center(
                child: Text('Add from Template'),
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
                      Provider.of<DataBackend>(
                        context,
                        listen: false,
                      ).creditCardTemplates = getLocalCreditCardTemplates();
                      Navigator.pushNamed(context, '/add_card_from_template');
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
                      Navigator.pushNamed(context, '/add_card_from_template');
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
                      Navigator.pushNamed(context, '/add_card_from_template');
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
                      Navigator.pushNamed(context, '/add_card_from_template');
                    }),
              ),
            ),
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
                          arguments: RemovePromoMeta(target, target.promos[0]));
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
                          arguments: RemovePromoMeta(target, target.promos[0]));
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
                          arguments: RemovePromoMeta(target, target.promos[0]));
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
                          arguments: RemovePromoMeta(target, target.promos[0]));
                    }),
              ),
            ),
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
            ListViewItem(
              child: Center(
                child: Text('Sign Up'),
              ),
            ),
            Divider(),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Signed In'),
                    onPressed: () {
                      Provider.of<AppAuth>(
                        context,
                        listen: false,
                      ).authState = AuthState.SIGNED_IN;
                      Navigator.pushNamed(context, '/sign_up');
                    }),
              ),
            ),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Not Signed In'),
                    onPressed: () {
                      Provider.of<AppAuth>(
                        context,
                        listen: false,
                      ).authState = AuthState.NOT_SIGNED_IN;
                      Navigator.pushNamed(context, '/sign_up');
                    }),
              ),
            ),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Loading'),
                    onPressed: () {
                      Provider.of<AppAuth>(
                        context,
                        listen: false,
                      ).authState = AuthState.LOADING;
                      Navigator.pushNamed(context, '/sign_up');
                    }),
              ),
            ),
            ListViewItem(
              child: Material(
                child: RaisedButton(
                    child: Text('Error'),
                    onPressed: () {
                      Provider.of<AppAuth>(
                        context,
                        listen: false,
                      ).authState = AuthState.ERROR;
                      Navigator.pushNamed(context, '/sign_up');
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

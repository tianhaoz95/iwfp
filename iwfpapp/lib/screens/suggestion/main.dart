import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/screens/suggestion/entries.dart';

class SuggestionScreen extends StatelessWidget {
  final DataStore dataStore;
  const SuggestionScreen(this.dataStore);
  @override
  Widget build(BuildContext context) {
    ShopCategory category = ShopCategory('Unknown Category', 'unknown');
    if (ModalRoute.of(context).settings.arguments != null) {
      category = ModalRoute.of(context).settings.arguments;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('For ' + category.name + ', I should use ...'),
        key: Key('suggestion_title'),
        leading: FlatButton(
          key: Key('suggestion_back_btn'),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/',
                arguments: HomeTabId.SHOPPING);
          },
        ),
      ),
      body: SuggestionEntries(category, dataStore),
    );
  }
}

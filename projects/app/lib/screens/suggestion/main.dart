import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/suggestion/entries.dart';
import 'package:iwfpapp/services/interfaces/shopping_category.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen();
  @override
  Widget build(BuildContext context) {
    ShoppingCategory category =
        createShoppingCategory('Unknown Category', 'unknown');
    if (ModalRoute.of(context).settings.arguments != null) {
      category = ModalRoute.of(context).settings.arguments;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('For ' + category.displayName + ', I should use ...'),
        key: Key('suggestion_title'),
      ),
      body: PreferredWidthContent(child: SuggestionEntries(category)),
    );
  }
}

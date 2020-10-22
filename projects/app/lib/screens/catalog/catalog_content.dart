import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/catalog/add_card_catalog.dart';
import 'package:iwfpapp/screens/catalog/add_from_template_catalog.dart';
import 'package:iwfpapp/screens/catalog/add_promotion.dart';
import 'package:iwfpapp/screens/catalog/edit_card_catalog.dart';
import 'package:iwfpapp/screens/catalog/home_catalog.dart';
import 'package:iwfpapp/screens/catalog/placeholder_catalog.dart';
import 'package:iwfpapp/screens/catalog/recommendation_catalog.dart';
import 'package:iwfpapp/screens/catalog/remove_card_catalog.dart';
import 'package:iwfpapp/screens/catalog/remove_promotion_catalog.dart';
import 'package:iwfpapp/screens/catalog/sign_in_catalog.dart';
import 'package:iwfpapp/screens/catalog/sign_up_catalog.dart';
import 'package:iwfpapp/services/config/typedefs/catalog_categories.dart';

class CatalogContent extends StatelessWidget {
  final CatalogCategory category;

  const CatalogContent({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (this.category) {
      case CatalogCategory.ADD_CARD:
        return AddCardCatalog();
      case CatalogCategory.ADD_FROM_TEMPLATE:
        return AddFromTemplateCatalog();
      case CatalogCategory.ADD_PROMOTION:
        return AddPromotionCatalog();
      case CatalogCategory.EDIT_CARD:
        return EditCardCatalog();
      case CatalogCategory.HOME:
        return HomeCatalog();
      case CatalogCategory.PLACEHOLDER:
        return PlaceholderCatalog();
      case CatalogCategory.RECOMMENDATIONS:
        return RecommendationCatalog();
      case CatalogCategory.REMOVE_CARD:
        return RemoveCardCatalog();
      case CatalogCategory.REMOVE_PROMOTION:
        return RemovePromotionCatalog();
      case CatalogCategory.SIGN_IN:
        return SignInCatalog();
      case CatalogCategory.SIGN_UP:
        return SignUpCatalog();
      default:
        return SignInCatalog();
    }
  }
}

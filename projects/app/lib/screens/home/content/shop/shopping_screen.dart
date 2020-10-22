import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/home/content/shop/categories.dart';
import 'package:iwfpapp/screens/home/content/shop/categories_outdated.dart';
import 'package:iwfpapp/screens/home/content/shop/fetching_categories.dart';
import 'package:iwfpapp/screens/home/content/shop/fetching_categories_error.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';
import 'package:provider/provider.dart';

class ShopNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(
      builder: (context, backend, child) {
        switch (backend.getStatus()) {
          case DataBackendStatus.AVAILABLE:
            return PreferredWidthContent(
                child: CategoriesShoppingScreen(
                    categories: backend.getShopCategories()));
          case DataBackendStatus.ERROR:
            return FetchingCategoriesError();
          case DataBackendStatus.LOADING:
            return FetchingCategories();
          case DataBackendStatus.OUTDATED:
            return CategoriesOutdated();
          default:
            return UnknownError();
        }
      },
    );
  }
}

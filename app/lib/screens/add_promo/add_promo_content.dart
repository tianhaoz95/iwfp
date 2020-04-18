import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_promo/add_promo_error.dart';
import 'package:iwfpapp/screens/add_promo/add_promo_pending.dart';
import 'package:iwfpapp/screens/add_promo/adding_promo.dart';
import 'package:iwfpapp/screens/add_promo/promo_added.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:provider/provider.dart';

class AddPromoContent extends StatelessWidget {
  final CreditCard card;
  final bool autoNav;
  const AddPromoContent({@required this.card, this.autoNav = true});
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(
      builder: (BuildContext context, DataBackend backend, Widget child) {
        switch (backend.getStatus()) {
          case DataBackendStatus.AVAILABLE:
            return AddPromoPending(
              card: this.card,
            );
          case DataBackendStatus.LOADING:
            return AddingPromo();
          case DataBackendStatus.OUTDATED:
            return PromoAdded(
              card: this.card,
              autoNav: this.autoNav,
            );
          case DataBackendStatus.ERROR:
            return AddPromoError();
          default:
            return UnknownError();
        }
      },
    );
  }
}

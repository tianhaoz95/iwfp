import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/remove_promo/promo_removed.dart';
import 'package:iwfpapp/screens/remove_promo/remove_promo_error.dart';
import 'package:iwfpapp/screens/remove_promo/remove_promo_pending.dart';
import 'package:iwfpapp/screens/remove_promo/removing_promo.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:provider/provider.dart';

class RemovePromoContent extends StatelessWidget {
  final RemovePromoMeta removePromoMeta;
  const RemovePromoContent({@required this.removePromoMeta});
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(
      builder: (BuildContext context, DataBackend backend, Widget child) {
        switch (backend.getStatus()) {
          case DataBackendStatus.AVAILABLE:
            return RemovePromoPending(
              removePromoMeta: this.removePromoMeta,
            );
          case DataBackendStatus.LOADING:
            return RemovingPromo();
          case DataBackendStatus.ERROR:
            return RemovePromoError();
          case DataBackendStatus.OUTDATED:
            return PromoRemoved(
              removePromoMeta: this.removePromoMeta,
            );
          default:
            return UnknownError();
        }
      },
    );
  }
}

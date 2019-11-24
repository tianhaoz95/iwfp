import 'package:iwfpapp/services/cashback_promo.dart';

class CreditCard {
  final String name;
  final String id;
  /// TODO(tianhaoz95): change promos implementation
  /// from list to map for better performance and
  /// readability.
  List<CashbackPromo> promos = [];
  CreditCard(this.name, this.id);
  void removePromo(CashbackPromo promo) {
     /// TODO(tianhaoz95): change this to a map find
     /// once promos switch its implementation from
     /// list to map.
    for (int i = 0; i < promos.length; ++i) {
      if (promos[i].id == promo.id) {
        promos.removeAt(i);
        return;
      }
    }
  }
}

import 'package:iwfpapp/services/interfaces/promotion.pb.dart';

class CreditCard {
  final String name;
  final String id;

  /// TODO(tianhaoz95): change promos implementation
  /// from list to map for better performance and
  /// readability.
  List<Promotion> promos = [];
  CreditCard(this.name, this.id, {List<Promotion> promos}) {
    if (promos != null) {
      this.promos = promos;
    }
  }

  void removePromo(Promotion promo) {
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

import 'package:iwfpapp/services/cashback_promo.dart';

class CreditCard {
  final String name;
  final String id;
  List<CashbackPromo> promos = [];
  CreditCard(this.name, this.id);
}

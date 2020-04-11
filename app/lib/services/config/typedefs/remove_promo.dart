import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';

class RemovePromoMeta {
  final CreditCard card;
  final CashbackPromo promo;
  const RemovePromoMeta(this.card, this.promo);
}

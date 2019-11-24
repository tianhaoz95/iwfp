import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/credit_card.dart';

class RemovePromoMeta {
  final CreditCard card;
  final CashbackPromo promo;
  const RemovePromoMeta(this.card, this.promo);
}
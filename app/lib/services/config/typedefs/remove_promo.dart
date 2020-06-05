import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/promotion.pb.dart';

class RemovePromoMeta {
  /// The target card that contains the promotion to
  /// be removed.
  /// The only required field in the card is the id
  /// and the rest of the card information is not used.
  final CreditCard card;

  /// The target promotion to be removed. The only
  /// required field is the ID.
  final Promotion promo;
  const RemovePromoMeta(this.card, this.promo);
}

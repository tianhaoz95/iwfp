import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/utilities/validators/card_expiration_validator.dart';

List<CashbackPromo> rankPromotionsWithTimeRange(List<CashbackPromo> promos) {
  List<CashbackPromo> rankedPromos = promos;
  rankedPromos.sort((CashbackPromo promoLhs, CashbackPromo promoRhs) {
    bool lhsPromoInTimeRange = isInValidTimeRange(promoLhs);
    bool rhsPromoInTimeRange = isInValidTimeRange(promoRhs);
    if (lhsPromoInTimeRange && !rhsPromoInTimeRange) {
      return 1;
    } else if (!lhsPromoInTimeRange && rhsPromoInTimeRange) {
      return -1;
    } else {
      return 0;
    }
  });
  return rankedPromos;
}
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/utilities/validators/card_expiration_validator.dart';

List<Promotion> rankPromotionsWithTimeRange(List<Promotion> promos) {
  List<Promotion> rankedPromos = promos;
  rankedPromos.sort((Promotion promoLhs, Promotion promoRhs) {
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

import 'package:iwfpapp/services/config/consts/promo_type_lookup.dart';
import 'package:iwfpapp/services/config/typedefs/promo_types.dart';

CashbackPromoType str2promoType(String promoTypeStr) {
  if (promoTypeLookup.containsKey(promoTypeStr)) {
    return promoTypeLookup[promoTypeStr];
  } else {
    return CashbackPromoType.UNKNOWN;
  }
}

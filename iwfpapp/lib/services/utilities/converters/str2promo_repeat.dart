import 'package:iwfpapp/services/config/consts/repeat_pattern_lookup.dart';
import 'package:iwfpapp/services/config/typedefs/repeat_pattern.dart';

CashbackPromoRepeatPattern str2promoRepeat(String promoRepeatStr) {
  if (repeatPatternLookup.containsKey(promoRepeatStr)) {
    return repeatPatternLookup[promoRepeatStr];
  } else {
    return CashbackPromoRepeatPattern.UNKNOWN;
  }
}

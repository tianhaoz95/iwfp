import 'package:iwfpapp/services/config/typedefs/repeat_pattern.dart';

Map<String, CashbackPromoRepeatPattern> repeatPatternLookup = {
  'const': CashbackPromoRepeatPattern.CONST,
  'annual': CashbackPromoRepeatPattern.ANNUAL,
};

Map<CashbackPromoRepeatPattern, String> repeatPatternNameLookup = {
  CashbackPromoRepeatPattern.CONST: 'Const',
  CashbackPromoRepeatPattern.ANNUAL: 'Annual',
};
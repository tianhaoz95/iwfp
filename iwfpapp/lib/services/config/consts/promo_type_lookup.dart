import 'package:iwfpapp/services/config/typedefs/promo_types.dart';

Map<String, CashbackPromoType> promoTypeLookup = {
  'universal': CashbackPromoType.UNIVERSAL,
  'sector': CashbackPromoType.SECTOR,
  'brand': CashbackPromoType.BRAND,
};

Map<CashbackPromoType, String> promoNameLookup = {
  CashbackPromoType.UNIVERSAL: 'Universal',
  CashbackPromoType.SECTOR: 'Sector',
  CashbackPromoType.BRAND: 'Brand',
};
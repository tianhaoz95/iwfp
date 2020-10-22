enum CashbackPromoType {
  /// UNIVERSAL represents the type of
  /// cash back promotion that applies to all
  /// transactions. For example, Chase Pay
  /// Apple Pay, etc
  UNIVERSAL,

  /// SECTOR represents the type of
  /// cash back promotions that applies
  /// to purchases in a certain sector.
  /// For example, gas stations,
  /// restaurants, drag stores, etc
  SECTOR,

  /// BRAND represents the type of
  /// cash back promotions that applies
  /// to purchase from certain brands.
  /// For example, Walmart, Target,
  /// BestBuy, etc
  BRAND,

  /// UNKNOWN is reserved for undefined
  /// types, mostly error
  UNKNOWN,
}

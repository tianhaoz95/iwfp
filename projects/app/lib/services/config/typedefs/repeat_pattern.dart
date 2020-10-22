enum CashbackPromoRepeatPattern {
  /// CONST means the cashback promotion
  /// does not expire at all time.
  CONST,

  /// ANNUAL means the cashback promotion
  /// is activated every year at the same
  /// period of time.
  ANNUAL,

  /// UNKNOWN means the cashback promotion
  /// is not recognized. Mostly it means error
  UNKNOWN,
}

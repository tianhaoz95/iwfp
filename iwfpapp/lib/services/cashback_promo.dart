class CashbackPromo {
  final String name;
  final String id;
  final String type;
  final String start;
  final String end;

  /// repeat indicates the rule for how the promotion repeats.
  /// supported types are:
  /// * annual (repeats annually between start and end)
  /// * const (constant, always the same. In this case, start and end are ignored)
  final String repeat;
  final int rate;
  const CashbackPromo(this.name, this.id, this.type, this.start, this.end,
      this.repeat, this.rate);
}

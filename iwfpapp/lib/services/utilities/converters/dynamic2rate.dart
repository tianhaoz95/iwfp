/// Converts dynamic type to cashback rate
int dynamic2rate(dynamic dynamicRate) {
  int promoRate = 0;
  if (dynamicRate is int) {
    promoRate = dynamicRate;
  }
  if (dynamicRate is String) {
    promoRate = int.parse(dynamicRate);
  }
  return promoRate;
}

/// Converts dynamic type to cashback rate
double dynamic2rate(dynamic dynamicRate) {
  double promoRate = 0;
  if (dynamicRate is int) {
    promoRate = dynamicRate.toDouble();
  } else if (dynamicRate is double) {
    promoRate = dynamicRate;
  } else if (dynamicRate is String) {
    promoRate = double.parse(dynamicRate);
  } else {
    throw 'dynamicRate is not a number';
  }
  return promoRate;
}

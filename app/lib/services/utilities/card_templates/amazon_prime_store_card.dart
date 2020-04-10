import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';

CreditCard amazonPrimeStoreCard =
    CreditCard('Amazon Prime Store Card', 'amazon_prime_store_card', promos: [
  CashbackPromo('Amazon.com', 'amazon', 'brand', 'nan', 'nan', 'const', 5,
      ShopCategory('Amazon.com', 'amazon')),
]);

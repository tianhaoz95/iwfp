import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

CreditCard amazonPrimeStoreCard =
    CreditCard('Amazon Prime Store Card', 'amazon_prime_store_card', promos: [
  createPromotion('Amazon.com', 'amazon', 'brand', 'nan', 'nan', 'const', 5,
      createShoppingCategory('Amazon.com', 'amazon')),
]);

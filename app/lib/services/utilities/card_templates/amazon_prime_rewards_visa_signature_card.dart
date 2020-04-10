import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';

CreditCard amazonPrimeRewardsVisaSignatureCard = CreditCard(
  'Amazon Prime Rewards Visa Signature Card',
  'amazon_prime_rewards_visa_signature_card',
  promos: [
    CashbackPromo(
        'Whole Foods Market',
        'whole_foods_market',
        'brand',
        'nan',
        'nan',
        'const',
        5,
        ShopCategory('Whole Foods Market', 'whole_foods_market')),
    CashbackPromo('Amazon.com', 'amazon', 'brand', 'nan', 'nan', 'const', 5,
        ShopCategory('Amazon.com', 'amazon')),
    CashbackPromo('Restaurants', 'restaurants', 'sector', 'nan', 'nan', 'const',
        2, ShopCategory('Restaurants', 'restaurants')),
    CashbackPromo('Grag Stores', 'drag_stores', 'sector', 'nan', 'nan', 'const',
        2, ShopCategory('Grag Stores', 'drag_stores')),
    CashbackPromo('Gas Station', 'gas_stations', 'sector', 'nan', 'nan',
        'const', 2, ShopCategory('Gas Station', 'gas_stations')),
    CashbackPromo('All Purchases', 'all_purchase', 'universal', 'nan', 'nan',
        'const', 1, ShopCategory('All Purchases', 'all_purchase')),
  ],
);

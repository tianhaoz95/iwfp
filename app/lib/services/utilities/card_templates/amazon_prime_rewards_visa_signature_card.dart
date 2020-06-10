import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

CreditCard amazonPrimeRewardsVisaSignatureCard = createCreditCard(
  'Amazon Prime Rewards Visa Signature Card',
  'amazon_prime_rewards_visa_signature_card',
  promos: [
    createPromotion(
        'Whole Foods Market',
        'whole_foods_market',
        'brand',
        'nan',
        'nan',
        'const',
        5,
        createShoppingCategory('Whole Foods Market', 'whole_foods_market')),
    createPromotion('Amazon.com', 'amazon', 'brand', 'nan', 'nan', 'const', 5,
        createShoppingCategory('Amazon.com', 'amazon')),
    createPromotion('Restaurants', 'restaurants', 'sector', 'nan', 'nan',
        'const', 2, createShoppingCategory('Restaurants', 'restaurants')),
    createPromotion('Grag Stores', 'drag_stores', 'sector', 'nan', 'nan',
        'const', 2, createShoppingCategory('Grag Stores', 'drag_stores')),
    createPromotion('Gas Station', 'gas_stations', 'sector', 'nan', 'nan',
        'const', 2, createShoppingCategory('Gas Station', 'gas_stations')),
    createPromotion('All Purchases', 'all_purchase', 'universal', 'nan', 'nan',
        'const', 1, createShoppingCategory('All Purchases', 'all_purchase')),
  ],
  officialUrl:
      'https://www.amazon.com/Amazon-Prime-Rewards-Visa-Signature-Card/dp/BT00LN946S',
);

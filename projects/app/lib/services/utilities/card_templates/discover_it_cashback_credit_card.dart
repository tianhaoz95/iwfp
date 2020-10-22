import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

CreditCard discoverItCashbackCreditCard = createCreditCard(
    'Discover it Cashback Credit Card', 'discover_it_cashback_credit_card',
    promos: [
      createPromotion(
          'Grocery Stores',
          'grocery_stores',
          'sector',
          '01/01',
          '03/31',
          'annual',
          5,
          createShoppingCategory('Grocery Stores', 'grocery_stores')),
      createPromotion(
          'Gas Stations',
          'gas_stations',
          'sector',
          '04/01',
          '06/30',
          'annual',
          5,
          createShoppingCategory('Gas Stations', 'gas_stations')),
      createPromotion('Uber', 'uber', 'sector', '04/01', '06/30', 'annual', 5,
          createShoppingCategory('Uber', 'uber')),
      createPromotion('Lyft', 'lyft', 'sector', '04/01', '06/30', 'annual', 5,
          createShoppingCategory('Lyft', 'lyft')),
      createPromotion('Restaurants', 'restaurants', 'sector', '07/01', '09/30',
          'annual', 5, createShoppingCategory('Restaurants', 'restaurants')),
      createPromotion('PayPal', 'paypal', 'payment', '07/01', '09/30', 'annual',
          5, createShoppingCategory('PayPal', 'paypal')),
      createPromotion('Amazon.com', 'amazon', 'brand', '10/01', '12/31',
          'annual', 5, createShoppingCategory('Amazon.com', 'amazon')),
      createPromotion('Target', 'target', 'brand', '10/01', '12/31', 'annual',
          5, createShoppingCategory('Target', 'target')),
      createPromotion(
          'Walmart.com',
          'walmart_online_store',
          'brand',
          '10/01',
          '12/31',
          'annual',
          5,
          createShoppingCategory('Walmart.com', 'walmart_online_store')),
      createPromotion(
          'All Purchases',
          'all_purchase',
          'universal',
          'nan',
          'nan',
          'const',
          1,
          createShoppingCategory('All Purchases', 'all_purchase')),
    ],
    officialUrl:
        'https://www.discover.com/credit-cards/cashback-bonus/cashback-calendar.html');

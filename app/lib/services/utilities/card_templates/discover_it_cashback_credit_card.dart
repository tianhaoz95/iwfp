import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

CreditCard discoverItCashbackCreditCard = CreditCard(
    'Discover it Cashback Credit Card', 'discover_it_cashback_credit_card',
    promos: [
      CashbackPromo(
          'Grocery Stores',
          'grocery_stores',
          'sector',
          '01/01',
          '03/31',
          'annual',
          5,
          createShoppingCategory('Grocery Stores', 'grocery_stores')),
      CashbackPromo('Gas Stations', 'gas_stations', 'sector', '04/01', '06/30',
          'annual', 5, createShoppingCategory('Gas Stations', 'gas_stations')),
      CashbackPromo('Uber', 'uber', 'sector', '04/01', '06/30', 'annual', 5,
          createShoppingCategory('Uber', 'uber')),
      CashbackPromo('Lyft', 'lyft', 'sector', '04/01', '06/30', 'annual', 5,
          createShoppingCategory('Lyft', 'lyft')),
      CashbackPromo('Restaurants', 'restaurants', 'sector', '07/01', '09/30',
          'annual', 5, createShoppingCategory('Restaurants', 'restaurants')),
      CashbackPromo('PayPal', 'paypal', 'payment', '07/01', '09/30', 'annual',
          5, createShoppingCategory('PayPal', 'paypal')),
      CashbackPromo('Amazon.com', 'amazon', 'brand', '10/01', '12/31', 'annual',
          5, createShoppingCategory('Amazon.com', 'amazon')),
      CashbackPromo('Target', 'target', 'brand', '10/01', '12/31', 'annual', 5,
          createShoppingCategory('Target', 'target')),
      CashbackPromo(
          'Walmart.com',
          'walmart_online_store',
          'brand',
          '10/01',
          '12/31',
          'annual',
          5,
          createShoppingCategory('Walmart.com', 'walmart_online_store')),
      CashbackPromo('All Purchases', 'all_purchase', 'universal', 'nan', 'nan',
          'const', 1, createShoppingCategory('All Purchases', 'all_purchase')),
    ]);

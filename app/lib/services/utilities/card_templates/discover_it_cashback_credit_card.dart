import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';

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
          ShopCategory('Grocery Stores', 'grocery_stores')),
      CashbackPromo('Gas Stations', 'gas_stations', 'sector', '04/01', '06/30',
          'annual', 5, ShopCategory('Gas Stations', 'gas_stations')),
      CashbackPromo('Uber', 'uber', 'sector', '04/01', '06/30', 'annual', 5,
          ShopCategory('Uber', 'uber')),
      CashbackPromo('Lyft', 'lyft', 'sector', '04/01', '06/30', 'annual', 5,
          ShopCategory('Lyft', 'lyft')),
      CashbackPromo('Restaurants', 'restaurants', 'sector', '07/01', '09/30',
          'annual', 5, ShopCategory('Restaurants', 'restaurants')),
      CashbackPromo('PayPal', 'paypal', 'payment', '07/01', '09/30', 'annual',
          5, ShopCategory('PayPal', 'paypal')),
      CashbackPromo('Amazon.com', 'amazon', 'brand', '10/01', '12/31', 'annual',
          5, ShopCategory('Amazon.com', 'amazon')),
      CashbackPromo('Target', 'target', 'brand', '10/01', '12/31', 'annual', 5,
          ShopCategory('Target', 'target')),
      CashbackPromo(
          'Walmart.com',
          'walmart_online_store',
          'brand',
          '10/01',
          '12/31',
          'annual',
          5,
          ShopCategory('Walmart.com', 'walmart_online_store')),
      CashbackPromo('All Purchases', 'all_purchase', 'universal', 'nan', 'nan',
          'const', 1, ShopCategory('All Purchases', 'all_purchase')),
    ]);

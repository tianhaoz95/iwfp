import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';

CreditCard discoverItCashbackDebit = CreditCard(
  'Discover it Cashback Debit',
  'discover_it_cashback_debit',
  promos: [
    CashbackPromo('All Purchases', 'all_purchase', 'universal', 'nan', 'nan',
        'const', 1, ShopCategory('All Purchases', 'all_purchase')),
  ],
);

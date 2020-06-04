import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

CreditCard chaseFreedom = CreditCard(
  'Chase Freedom',
  'chase_freedom',
  promos: [
    CashbackPromo(
      'Gas Station',
      'gas_stations',
      'sector',
      '01/01',
      '03/31',
      'annual',
      5,
      createShoppingCategory('Gas Station', 'gas_stations'),
    ),
    CashbackPromo('Grag Stores', 'drag_stores', 'sector', '01/01', '03/31',
        'annual', 5, createShoppingCategory('Grag Stores', 'drag_stores')),
    CashbackPromo(
        'Grocery Stores',
        'grocery_stores',
        'sector',
        '04/01',
        '06/30',
        'annual',
        5,
        createShoppingCategory('Grocery Stores', 'grocery_stores')),
    CashbackPromo(
        'Home Improvement Stores',
        'home_improvement_stores',
        'sector',
        '04/01',
        '06/30',
        'annual',
        5,
        createShoppingCategory(
            'Home Improvement Stores', 'home_improvement_stores')),
    CashbackPromo(
        'Streaming Services',
        'streaming_services',
        'sector',
        '07/01',
        '09/30',
        'annual',
        5,
        createShoppingCategory('Streaming Services', 'streaming_services')),
    CashbackPromo('Chase Pay', 'chase_pay', 'payment', '10/01', '12/31',
        'annual', 5, createShoppingCategory('Chase Pay', 'chase_pay')),
    CashbackPromo('PayPal', 'paypal', 'payment', '10/01', '12/31', 'annual', 5,
        createShoppingCategory('PayPal', 'paypal')),
    CashbackPromo('All Purchases', 'all_purchase', 'universal', 'nan', 'nan',
        'const', 1, createShoppingCategory('All Purchases', 'all_purchase')),
  ],
);

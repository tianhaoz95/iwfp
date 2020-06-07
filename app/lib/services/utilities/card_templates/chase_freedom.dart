import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

CreditCard chaseFreedom = createCreditCard(
  'Chase Freedom',
  'chase_freedom',
  promos: [
    createPromotion(
      'Gas Station',
      'gas_stations',
      'sector',
      '01/01',
      '03/31',
      'annual',
      5,
      createShoppingCategory('Gas Station', 'gas_stations'),
    ),
    createPromotion('Grag Stores', 'drag_stores', 'sector', '01/01', '03/31',
        'annual', 5, createShoppingCategory('Grag Stores', 'drag_stores')),
    createPromotion(
        'Grocery Stores',
        'grocery_stores',
        'sector',
        '04/01',
        '06/30',
        'annual',
        5,
        createShoppingCategory('Grocery Stores', 'grocery_stores')),
    createPromotion(
        'Home Improvement Stores',
        'home_improvement_stores',
        'sector',
        '04/01',
        '06/30',
        'annual',
        5,
        createShoppingCategory(
            'Home Improvement Stores', 'home_improvement_stores')),
    createPromotion(
        'Streaming Services',
        'streaming_services',
        'sector',
        '07/01',
        '09/30',
        'annual',
        5,
        createShoppingCategory('Streaming Services', 'streaming_services')),
    createPromotion('Chase Pay', 'chase_pay', 'payment', '10/01', '12/31',
        'annual', 5, createShoppingCategory('Chase Pay', 'chase_pay')),
    createPromotion('PayPal', 'paypal', 'payment', '10/01', '12/31', 'annual',
        5, createShoppingCategory('PayPal', 'paypal')),
    createPromotion('All Purchases', 'all_purchase', 'universal', 'nan', 'nan',
        'const', 1, createShoppingCategory('All Purchases', 'all_purchase')),
  ],
);

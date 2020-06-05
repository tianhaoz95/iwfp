import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

CreditCard petal = CreditCard(
  'Petal Credit Card',
  'petal',
  promos: [
    createPromotion('All Purchases', 'all_purchase', 'universal', 'nan', 'nan',
        'const', 1, createShoppingCategory('All Purchases', 'all_purchase')),
  ],
);

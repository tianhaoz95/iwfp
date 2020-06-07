import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

CreditCard petal = createCreditCard(
  'Petal Credit Card',
  'petal',
  promos: [
    createPromotion('All Purchases', 'all_purchase', 'universal', 'nan', 'nan',
        'const', 1, createShoppingCategory('All Purchases', 'all_purchase')),
  ],
);

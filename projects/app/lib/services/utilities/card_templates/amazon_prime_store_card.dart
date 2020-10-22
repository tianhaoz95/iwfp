import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

CreditCard amazonPrimeStoreCard = createCreditCard(
    'Amazon Prime Store Card', 'amazon_prime_store_card',
    promos: [
      createPromotion('Amazon.com', 'amazon', 'brand', 'nan', 'nan', 'const', 5,
          createShoppingCategory('Amazon.com', 'amazon')),
    ],
    officialUrl:
        'https://www.amazon.com/gp/cobrandcard/marketing.html?pr=conplcc');

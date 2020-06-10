import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

CreditCard discoverItCashbackDebit =
    createCreditCard('Discover it Cashback Debit', 'discover_it_cashback_debit',
        promos: [
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
        officialUrl: 'https://www.discover.com/online-banking/checking/');

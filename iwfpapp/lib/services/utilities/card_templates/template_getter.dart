import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/amazon_prime_store_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/chase_freedom.dart';
import 'package:iwfpapp/services/utilities/card_templates/discover_it_cashback_credit_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/discover_it_cashback_debit.dart';

/// Gets local credit card templates
List<CreditCard> getLocalCreditCardTemplates() {
  List<CreditCard> creditCardMetadataList = [
    discoverItCashbackDebit,
    discoverItCashbackCreditCard,
    amazonPrimeStoreCard,
    chaseFreedom
  ];
  return creditCardMetadataList;
}

/// Gets local and remote credit card templates and combines
Future<List<CreditCard>> getCreditCardTemplates() async {
  List<CreditCard> creditCardTemplateList = getLocalCreditCardTemplates();
  return creditCardTemplateList;
}
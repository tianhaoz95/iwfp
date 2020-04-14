import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/amazon_prime_rewards_visa_signature_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/amazon_prime_store_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/chase_freedom.dart';
import 'package:iwfpapp/services/utilities/card_templates/discover_it_cashback_credit_card.dart';
import 'package:iwfpapp/services/utilities/card_templates/discover_it_cashback_debit.dart';
import 'package:iwfpapp/services/utilities/card_templates/petal.dart';

/// Gets local credit card templates
List<CreditCard> getLocalCreditCardTemplates() {
  List<CreditCard> creditCardMetadataList = [
    discoverItCashbackDebit,
    discoverItCashbackCreditCard,
    amazonPrimeStoreCard,
    chaseFreedom,
    amazonPrimeRewardsVisaSignatureCard,
    petal,
  ];
  return creditCardMetadataList;
}

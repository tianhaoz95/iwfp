import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_getter.dart';

/// Error data backend
///
/// This implementation of backend throws exceptions
/// whenever it receives a request which is great for
/// testing error recovery.
class ErrorDataBackend extends DataBackend {
  ErrorDataBackend() : super() {
    /// This is needed because there is no way to test
    /// remove card error recovery otherwise as the card
    /// cannot be added in the first place.
    this.creditCards.add(getRandomCreditCardTemplate());
    this.creditCards.add(getRandomCreditCardTemplate());
  }

  @override
  Future<void> addCreditCardToDatabase(CreditCardAdditionRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    throw UnimplementedError();
  }

  @override
  Future<void> addPromitionToDatabase(PromotionAdditionRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccountFromDatabase() async {
    await Future.delayed(Duration(milliseconds: 200));
    throw UnimplementedError();
  }

  @override
  Future<List<CreditCard>> fetchCreditCardsFromDatabase() async {
    await Future.delayed(Duration(milliseconds: 200));
    throw UnimplementedError();
  }

  @override
  Future<void> initCreditCardInDatabase(CreditCardInitRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    throw UnimplementedError();
  }

  @override
  Future<void> initCreditCardWithTemplateInDatabase(
      CreditCardAdditionRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    throw UnimplementedError();
  }

  @override
  Future<void> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    throw UnimplementedError();
  }

  @override
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    throw UnimplementedError();
  }
}

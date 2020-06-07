import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/request.pbserver.dart';

class DumbDataBackend extends DataBackend {
  @override
  Future<void> addCreditCardToDatabase(CreditCardCreationRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> addPromitionToDatabase(PromotionAdditionRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> deleteAccountFromDatabase() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<List<CreditCard>> fetchCreditCardsFromDatabase() async {
    await Future.delayed(Duration(milliseconds: 200));
    return [];
  }

  @override
  Future<void> initCreditCardInDatabase(CreditCardCreationRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> initCreditCardWithTemplateInDatabase(
      CreditCardCreationRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
  }
}

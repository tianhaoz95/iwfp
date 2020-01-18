import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_store/base.dart';

class InAppDataBackend extends DataBackend {
  HttpsCallable addCardCallable;
  HttpsCallable addPromoCallable;
  HttpsCallable getCardsCallable;
  HttpsCallable removeCardCallable;
  HttpsCallable removePromoCallable;
  HttpsCallable deleteAccountCallable;

  @override
  InAppDataBackend() : super() {}

  @override
  Future<List<CreditCard>> fetchCreditCardsFromDatabase() async {
    return [];
  }

  @override
  Future<BackendResponse> initCreditCardInDatabase(
      CreditCardInitRequest req) async {
    BackendResponse response = BackendResponse(ResponseStatus.SUCCEESS, 'na');
    return response;
  }

  @override
  Future<BackendResponse> addCreditCardToDatabase(
      CreditCardAdditionRequest req) async {
    BackendResponse response = BackendResponse(ResponseStatus.SUCCEESS, 'na');
    return response;
  }

  @override
  Future<BackendResponse> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req) async {
    BackendResponse response = BackendResponse(ResponseStatus.SUCCEESS, 'na');
    return response;
  }

  @override
  Future<BackendResponse> addPromitionToDatabase(
      PromotionAdditionRequest req) async {
    BackendResponse response = BackendResponse(ResponseStatus.SUCCEESS, 'na');
    return response;
  }

  @override
  Future<BackendResponse> removePromotionFromDatabase(
      PromotionRemovalRequest req) async {
    BackendResponse response = BackendResponse(ResponseStatus.SUCCEESS, 'na');
    return response;
  }
}

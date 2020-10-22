import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/request.pbserver.dart';
import 'package:iwfpapp/services/utilities/converters/data2cards.dart';

class InAppDataBackend extends DataBackend {
  HttpsCallable addCardCallable;
  HttpsCallable addPromoCallable;
  HttpsCallable getCardsCallable;
  HttpsCallable removeCardCallable;
  HttpsCallable removePromoCallable;
  HttpsCallable deleteAccountCallable;
  CloudFunctions cloudFunc;

  @override
  Future<void> initialize() async {
    cloudFunc = CloudFunctions.instance;
    addCardCallable = cloudFunc.getHttpsCallable(
      functionName: 'addCreditCard',
    );
    getCardsCallable = cloudFunc.getHttpsCallable(
      functionName: 'getCreditCards',
    );
    removeCardCallable = cloudFunc.getHttpsCallable(
      functionName: 'removeCreditCard',
    );
    addPromoCallable = cloudFunc.getHttpsCallable(
      functionName: 'addPromo',
    );
    removePromoCallable = cloudFunc.getHttpsCallable(
      functionName: 'removePromo',
    );
    deleteAccountCallable = cloudFunc.getHttpsCallable(
      functionName: 'removeUser',
    );
  }

  @override
  Future<void> deleteAccountFromDatabase() async {
    await deleteAccountCallable.call();
  }

  @override
  Future<List<CreditCard>> fetchCreditCardsFromDatabase() async {
    HttpsCallableResult result = await getCardsCallable.call();
    List<CreditCard> fetchedCards = data2cards(result);
    return fetchedCards;
  }

  @override
  Future<void> initCreditCardInDatabase(CreditCardCreationRequest req) async {
    await addCardCallable.call(req.toProto3Json());
  }

  @override
  Future<void> initCreditCardWithTemplateInDatabase(
      CreditCardCreationRequest req) async {
    await addCardCallable.call(req.toProto3Json());
  }

  @override
  Future<BackendResponse> addCreditCardToDatabase(
      CreditCardCreationRequest req) async {
    BackendResponse response = BackendResponse(ResponseStatus.SUCCEESS, 'na');
    return response;
  }

  @override
  Future<void> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req) async {
    await removeCardCallable.call(req.toProto3Json());
  }

  @override
  Future<void> addPromitionToDatabase(PromotionAdditionRequest req) async {
    await addPromoCallable.call(req.toProto3Json());
  }

  @override
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req) async {
    await removePromoCallable.call(req.toProto3Json());
  }
}

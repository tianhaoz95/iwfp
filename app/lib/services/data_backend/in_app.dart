import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
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
  InAppDataBackend() : super() {
    cloudFunc = CloudFunctions.instance;
    if (useEmulator) {
      print('Using local emulator as backend...');
      cloudFunc.useFunctionsEmulator(origin: 'http://localhost:5001');
    }
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
    try {
      HttpsCallableResult result = await getCardsCallable.call();
      List<CreditCard> fetchedCards = data2cards(result);
      return fetchedCards;
    } on CloudFunctionsException catch (cloudFuncError) {
      print('fetch card failed with cloud function error');
      print(cloudFuncError.code);
      print(cloudFuncError.message);
      return [];
    } catch (err) {
      print(err.toString());
      return [];
    }
  }

  @override
  Future<void> initCreditCardInDatabase(CreditCardInitRequest req) async {
    await addCardCallable.call(<String, dynamic>{
      'id': req.card.id,
      'name': req.card.name,
    });
  }

  @override
  Future<BackendResponse> addCreditCardToDatabase(
      CreditCardAdditionRequest req) async {
    BackendResponse response = BackendResponse(ResponseStatus.SUCCEESS, 'na');
    return response;
  }

  @override
  Future<void> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req) async {
    await removeCardCallable.call(<String, dynamic>{'id': req.id});
  }

  @override
  Future<BackendResponse> addPromitionToDatabase(
      PromotionAdditionRequest req) async {
    BackendResponse response =
        BackendResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      HttpsCallableResult result =
          await addPromoCallable.call(<String, dynamic>{
        'cardUid': req.target,
        'promoName': req.promo.name,
        'promoId': req.promo.id,
        'promoType': req.promo.type,
        'promoStart': req.promo.start,
        'promoEnd': req.promo.end,
        'promoRepeat': req.promo.repeat,
        'promoRate': req.promo.rate,
        'promoCategoryName': req.promo.category.name,
        'promoCategoryId': req.promo.category.id,
      });
      response.status = ResponseStatus.SUCCEESS;
      response.msg = result.toString();
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      return response;
    }
  }

  @override
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req) async {
    await removePromoCallable.call(<String, dynamic>{
      'cardUid': req.target,
      'promoId': req.id,
    });
  }
}

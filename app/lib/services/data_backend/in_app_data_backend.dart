import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/utilities/converters/data2cards.dart';

class InAppDataBackend extends DataBackend {
  HttpsCallable addCardCallable;
  HttpsCallable addCardWithTemplateCallable;
  HttpsCallable addPromoCallable;
  HttpsCallable getCardsCallable;
  HttpsCallable removeCardCallable;
  HttpsCallable removePromoCallable;
  HttpsCallable deleteAccountCallable;
  CloudFunctions cloudFunc;

  @override
  InAppDataBackend() : super() {
    cloudFunc = CloudFunctions.instance;
    addCardCallable = cloudFunc.getHttpsCallable(
      functionName: 'addCreditCard',
    );
    addCardWithTemplateCallable =
        cloudFunc.getHttpsCallable(functionName: 'addCreditCardWithTemplate');
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
  Future<void> initCreditCardInDatabase(CreditCardInitRequest req) async {
    await addCardCallable.call(<String, dynamic>{
      'id': req.card.id,
      'name': req.card.name,
    });
  }

  @override
  Future<void> initCreditCardWithTemplateInDatabase(
      CreditCardAdditionRequest req) async {
    Map<String, dynamic> serverRequest = {
      'name': req.card.name,
      'id': req.card.id,
      'promos': []
    };
    List<dynamic> promos = [];
    for (CashbackPromo promo in req.card.promos) {
      Map<String, dynamic> promoData = {
        'cardUid': req.card.id,
        'promoId': promo.id,
        'promoName': promo.name,
        'promoType': promo.type,
        'promoStart': promo.start,
        'promoEnd': promo.end,
        'promoRepeat': promo.repeat,
        'promoRate': promo.rate,
        'promoCategoryId': promo.category.id,
        'promoCategoryName': promo.category.name,
      };
      promos.add(promoData);
    }
    serverRequest['promos'] = promos;
    await addCardWithTemplateCallable.call(serverRequest);
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
  Future<void> addPromitionToDatabase(PromotionAdditionRequest req) async {
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
  }

  @override
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req) async {
    await removePromoCallable.call(<String, dynamic>{
      'cardUid': req.target,
      'promoId': req.id,
    });
  }
}

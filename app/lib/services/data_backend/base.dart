import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/utilities/rankers/card_reward_ranker.dart';
import 'package:iwfpapp/services/utilities/category_counter.dart';

abstract class DataBackend extends ChangeNotifier {
  String token;
  bool useEmulator;
  DataBackendStatus status;
  List<CreditCard> creditCards;

  DataBackend() {
    useEmulator = false;
    status = DataBackendStatus.OUTDATED;
    token = 'unknown';
  }

  DataBackendStatus getStatus() {
    return status;
  }

  void setUseEmulator(bool setVal) {
    useEmulator = setVal;
  }

  void setToken(String tokenVal) {
    token = tokenVal;
  }

  bool shouldRefresh() {
    if (status == DataBackendStatus.OUTDATED) {
      return true;
    }
    return false;
  }

  void setShouldRefresh() {
    status = DataBackendStatus.OUTDATED;
    notifyListeners();
  }

  void setRefreshed() {
    status = DataBackendStatus.AVAILABLE;
    notifyListeners();
  }

  Future<BackendResponse> forceRefreshCards() async {
    setShouldRefresh();
    BackendResponse response = await maybeRefreshCards();
    return response;
  }

  Future<BackendResponse> maybeRefreshCards() async {
    BackendResponse response =
        BackendResponse(ResponseStatus.FAILURE, 'Not started');
    bool refresh = shouldRefresh();
    if (refresh) {
      try {
        creditCards = await fetchCreditCardsFromDatabase();
        response.status = ResponseStatus.SUCCEESS;
        response.msg = 'n/a, fetch succeeded';
        setRefreshed();
      } on CloudFunctionsException catch (cloudFuncError) {
        response.status = ResponseStatus.FAILURE;
        response.msg = cloudFuncError.message;
      } catch (err) {
        response.status = ResponseStatus.FAILURE;
        response.msg = err.toString();
      }
    } else {
      response.status = ResponseStatus.SUCCEESS;
      response.msg = 'Data up to date, no need to refresh';
    }
    return response;
  }

  Future<BackendResponse> initCreditCard(CreditCardInitRequest req) async {
    BackendResponse response = await initCreditCardInDatabase(req);
    setShouldRefresh();
    return response;
  }

  Future<BackendResponse> initCreditCardWithTemplate(
      CreditCardAdditionRequest req) async {
    BackendResponse response =
        BackendResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      await initCreditCard(CreditCardInitRequest(req.card));
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      return response;
    }
    try {
      for (CashbackPromo promo in req.card.promos) {
        await addPromotion(PromotionAdditionRequest(req.card.id, promo));
      }
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      return response;
    }
    response.status = ResponseStatus.SUCCEESS;
    return response;
  }

  Future<BackendResponse> addCreditCard(CreditCardAdditionRequest req) async {
    BackendResponse response = await addCreditCardToDatabase(req);
    setShouldRefresh();
    return response;
  }

  Future<BackendResponse> removeCreditCard(CreditCardRemovalRequest req) async {
    BackendResponse response = await removeCreditCardFromDatabase(req);
    setShouldRefresh();
    return response;
  }

  Future<BackendResponse> addPromotion(PromotionAdditionRequest req) async {
    BackendResponse response = await addPromitionToDatabase(req);
    setShouldRefresh();
    return response;
  }

  Future<BackendResponse> removePromotion(PromotionRemovalRequest req) async {
    BackendResponse response = await removePromotionFromDatabase(req);
    setShouldRefresh();
    return response;
  }

  Future<List<ShopCategory>> getShopCategories() async {
    BackendResponse status = await maybeRefreshCards();
    if (status.status == ResponseStatus.FAILURE) {
      return [];
    }
    return getUniqueShoppingCategories(creditCards);
  }

  List<ShopCategory> getShopCategoriesSync() {
    return getUniqueShoppingCategories(creditCards);
  }

  Future<CreditCard> renewCreditCardInfo(CreditCard card) async {
    await maybeRefreshCards();
    for (CreditCard searchCard in creditCards) {
      if (searchCard.id == card.id) {
        return searchCard;
      }
    }
    return card;
  }

  Future<List<CreditCard>> getCreditCards() async {
    BackendResponse status = await maybeRefreshCards();
    if (status.status == ResponseStatus.FAILURE) {
      return [];
    }
    return creditCards;
  }

  List<CreditCard> getCreditCardsSync() {
    return creditCards;
  }

  Future<List<CreditCard>> getRankedCreditCards(ShopCategory category) async {
    BackendResponse status = await maybeRefreshCards();
    if (status.status == ResponseStatus.FAILURE) {
      return [];
    }
    rankCards(creditCards, category);
    return creditCards;
  }

  List<CreditCard> getRankedCreditCardsSync(ShopCategory category) {
    rankCards(creditCards, category);
    return creditCards;
  }

  Future<BackendResponse> deleteAccount() async {
    BackendResponse response = await deleteAccountFromDatabase();
    return response;
  }

  @protected
  Future<BackendResponse> deleteAccountFromDatabase();

  @protected
  Future<List<CreditCard>> fetchCreditCardsFromDatabase();

  @protected
  Future<BackendResponse> initCreditCardInDatabase(CreditCardInitRequest req);

  @protected
  Future<BackendResponse> addCreditCardToDatabase(
      CreditCardAdditionRequest req);

  @protected
  Future<BackendResponse> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req);

  @protected
  Future<BackendResponse> addPromitionToDatabase(PromotionAdditionRequest req);

  @protected
  Future<BackendResponse> removePromotionFromDatabase(
      PromotionRemovalRequest req);
}

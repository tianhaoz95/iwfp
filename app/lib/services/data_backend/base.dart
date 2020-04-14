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
  DeleteAccountStatus deleteAccountStatus;
  List<CreditCard> creditCards;

  DataBackend() {
    useEmulator = false;
    status = DataBackendStatus.OUTDATED;
    deleteAccountStatus = DeleteAccountStatus.PENDING;
    token = 'unknown';
  }

  DataBackendStatus getStatus() {
    return status;
  }

  DeleteAccountStatus getDeleteAccountStatus() {
    return deleteAccountStatus;
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

  Future<void> initCreditCard(CreditCardInitRequest req) async {
    maybeRefreshCards();
    try {
      status = DataBackendStatus.LOADING;
      notifyListeners();
      await initCreditCardInDatabase(req);
      status = DataBackendStatus.OUTDATED;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      status = DataBackendStatus.ERROR;
      notifyListeners();
    }
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

  Future<void> addCreditCard(CreditCardAdditionRequest req) async {
    try {
      status = DataBackendStatus.LOADING;
      notifyListeners();
      await addCreditCardToDatabase(req);
      setShouldRefresh();
      status = DataBackendStatus.OUTDATED;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      status = DataBackendStatus.ERROR;
      notifyListeners();
    }
  }

  Future<void> removeCreditCard(CreditCardRemovalRequest req) async {
    try {
      status = DataBackendStatus.LOADING;
      notifyListeners();
      await removeCreditCardFromDatabase(req);
      status = DataBackendStatus.OUTDATED;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      status = DataBackendStatus.ERROR;
      notifyListeners();
    }
  }

  Future<BackendResponse> addPromotion(PromotionAdditionRequest req) async {
    BackendResponse response = await addPromitionToDatabase(req);
    setShouldRefresh();
    return response;
  }

  Future<void> removePromotion(PromotionRemovalRequest req) async {
    try {
      status = DataBackendStatus.LOADING;
      notifyListeners();
      await removePromotionFromDatabase(req);
      status = DataBackendStatus.OUTDATED;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      status = DataBackendStatus.ERROR;
      notifyListeners();
    }
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

  Future<void> deleteAccount() async {
    try {
      deleteAccountStatus = DeleteAccountStatus.DELETEING;
      notifyListeners();
      await deleteAccountFromDatabase();
      deleteAccountStatus = DeleteAccountStatus.DELETED;
      notifyListeners();
    } on CloudFunctionsException catch (cloudFuncError) {
      print(cloudFuncError.code);
      print(cloudFuncError.message);
      deleteAccountStatus = DeleteAccountStatus.ERROR;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      deleteAccountStatus = DeleteAccountStatus.ERROR;
      notifyListeners();
    }
  }

  @protected
  Future<void> deleteAccountFromDatabase();

  @protected
  Future<List<CreditCard>> fetchCreditCardsFromDatabase();

  @protected
  Future<void> initCreditCardInDatabase(CreditCardInitRequest req);

  @protected
  Future<void> addCreditCardToDatabase(CreditCardAdditionRequest req);

  @protected
  Future<void> removeCreditCardFromDatabase(CreditCardRemovalRequest req);

  @protected
  Future<BackendResponse> addPromitionToDatabase(PromotionAdditionRequest req);

  @protected
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req);
}

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/request.pb.dart';
import 'package:iwfpapp/services/interfaces/shopping_category.pbserver.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_getter.dart';
import 'package:iwfpapp/services/utilities/rankers/card_reward_ranker.dart';
import 'package:iwfpapp/services/utilities/category_counter.dart';

abstract class DataBackend extends ChangeNotifier {
  DataBackendStatus status;

  /// TODO(#453): merge it with status
  DeleteAccountStatus deleteAccountStatus;
  List<CreditCard> creditCards;
  bool creditCardsDirty;
  List<CreditCard> creditCardTemplates;
  bool creditCardTempaltesDirty;

  /// Token is use in http requests to perform
  /// user authentication and authorization.
  /// It is not needed in the in-app API calls
  /// since it has been taken care of by the
  /// Firebase SDK.
  String token;

  DataBackend() {
    status = DataBackendStatus.OUTDATED;
    deleteAccountStatus = DeleteAccountStatus.PENDING;
    creditCards = [];
    creditCardsDirty = true;
    creditCardTemplates = [];
    creditCardTempaltesDirty = true;
    token = 'unknown';
  }

  DataBackendStatus getStatus() {
    return status;
  }

  DeleteAccountStatus getDeleteAccountStatus() {
    return deleteAccountStatus;
  }

  void setToken(String tokenVal) {
    token = tokenVal;
  }

  List<CreditCard> getCreditCards() {
    return creditCards;
  }

  List<CreditCard> getCreditCardTemplates() {
    return creditCardTemplates;
  }

  List<ShoppingCategory> getShopCategories() {
    return getUniqueShoppingCategories(creditCards);
  }

  Future<void> forceRefresh() async {
    status = DataBackendStatus.OUTDATED;
    creditCardsDirty = true;
    creditCardTempaltesDirty = true;
    await maybeRefreshCards();
  }

  Future<void> maybeRefresh({bool silent = false}) async {
    try {
      await maybeRefreshCards(silent: silent);
      await maybeRefreshCreditCardTemplates(silent: silent);
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> maybeRefreshCards({bool silent = false}) async {
    if (creditCardsDirty || status == DataBackendStatus.ERROR) {
      try {
        await Future.delayed(Duration(milliseconds: 200));
        status = DataBackendStatus.LOADING;
        if (!silent) {
          notifyListeners();
        }
        creditCards = await fetchCreditCardsFromDatabase();
        creditCardsDirty = false;
        status = DataBackendStatus.AVAILABLE;
        if (!silent) {
          notifyListeners();
        }
      } on CloudFunctionsException catch (cloudFuncError) {
        print(cloudFuncError.message);
        status = DataBackendStatus.ERROR;
        if (!silent) {
          notifyListeners();
        }
      } catch (err) {
        print(err.toString());
        status = DataBackendStatus.ERROR;
        if (!silent) {
          notifyListeners();
        }
      }
    } else {
      print('Data up to date, no need to refresh');
    }
  }

  Future<void> maybeRefreshCreditCardTemplates({bool silent = false}) async {
    if (creditCardTempaltesDirty || status == DataBackendStatus.ERROR) {
      try {
        await Future.delayed(Duration(milliseconds: 200));
        status = DataBackendStatus.LOADING;
        if (!silent) {
          notifyListeners();
        }
        creditCardTemplates = await getLocalCreditCardTemplates();
        await Duration(milliseconds: 200);
        creditCardTempaltesDirty = false;
        status = DataBackendStatus.AVAILABLE;
        if (!silent) {
          notifyListeners();
        }
      } catch (err) {
        print(err.toString());
        creditCardTemplates = [];
        status = DataBackendStatus.ERROR;
        if (!silent) {
          notifyListeners();
        }
      }
    } else {
      print('Tempalte up-to-date.');
    }
  }

  CreditCard queryCreditCard(String id) {
    for (CreditCard card in creditCards) {
      if (card.id == id) {
        return card;
      }
    }
    return createCreditCard('Unknown', 'unknown');
  }

  Future<void> recoverFromError() async {
    await Future.delayed(Duration(milliseconds: 100));
    status = DataBackendStatus.LOADING;
    notifyListeners();
    await maybeRefresh(silent: true);
    if (status == DataBackendStatus.ERROR) {
      creditCards = [];
      creditCardTemplates = getLocalCreditCardTemplates();
      status = DataBackendStatus.AVAILABLE;
    }
    notifyListeners();
  }

  Future<void> initCreditCard(CreditCardCreationRequest req,
      {bool silent = false}) async {
    try {
      status = DataBackendStatus.LOADING;
      if (!silent) {
        notifyListeners();
      }
      await initCreditCardInDatabase(req);
      status = DataBackendStatus.OUTDATED;
      creditCardsDirty = true;
      if (!silent) {
        notifyListeners();
      }
    } catch (err) {
      print(err.toString());
      status = DataBackendStatus.ERROR;
      if (!silent) {
        notifyListeners();
      } else {
        throw err;
      }
    }
  }

  Future<void> initCreditCardWithTemplate(CreditCardCreationRequest req) async {
    try {
      status = DataBackendStatus.LOADING;
      notifyListeners();

      /// TODO: add this to child classes
      /*
      await initCreditCard(CreditCardInitRequest(req.card), silent: true);
      for (CashbackPromo promo in req.card.promos) {
        await addPromotion(PromotionAdditionRequest(req.card.id, promo),
            silent: true);
      }
      */
      await initCreditCardWithTemplateInDatabase(req);
      creditCardsDirty = true;
      status = DataBackendStatus.OUTDATED;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      status = DataBackendStatus.ERROR;
      notifyListeners();
    }
  }

  Future<void> addCreditCard(CreditCardCreationRequest req) async {
    try {
      status = DataBackendStatus.LOADING;
      notifyListeners();
      await addCreditCardToDatabase(req);
      creditCardsDirty = true;
      status = DataBackendStatus.OUTDATED;
      notifyListeners();
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
      creditCardsDirty = true;
      status = DataBackendStatus.OUTDATED;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      status = DataBackendStatus.ERROR;
      notifyListeners();
    }
  }

  Future<void> addPromotion(PromotionAdditionRequest req,
      {bool silent = false}) async {
    try {
      status = DataBackendStatus.LOADING;
      if (!silent) {
        notifyListeners();
      }
      await addPromitionToDatabase(req);
      creditCardsDirty = true;
      status = DataBackendStatus.OUTDATED;
      if (!silent) {
        notifyListeners();
      }
    } catch (err) {
      print(err.toString());
      status = DataBackendStatus.ERROR;
      if (!silent) {
        notifyListeners();
      } else {
        throw err;
      }
    }
  }

  Future<void> removePromotion(PromotionRemovalRequest req) async {
    try {
      status = DataBackendStatus.LOADING;
      notifyListeners();
      await removePromotionFromDatabase(req);
      creditCardsDirty = true;
      status = DataBackendStatus.OUTDATED;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      status = DataBackendStatus.ERROR;
      notifyListeners();
    }
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

  List<CreditCard> getRankedCreditCardsSync(ShoppingCategory category) {
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
  Future<void> initCreditCardInDatabase(CreditCardCreationRequest req);

  @protected
  Future<void> initCreditCardWithTemplateInDatabase(
      CreditCardCreationRequest req);

  @protected
  Future<void> addCreditCardToDatabase(CreditCardCreationRequest req);

  @protected
  Future<void> removeCreditCardFromDatabase(CreditCardRemovalRequest req);

  @protected
  Future<void> addPromitionToDatabase(PromotionAdditionRequest req);

  @protected
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req);
}

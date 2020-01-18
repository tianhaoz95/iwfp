import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/context.dart';
import 'package:iwfpapp/services/utilities/card_ranker.dart';
import 'package:iwfpapp/services/utilities/category_counter.dart';
import 'package:iwfpapp/services/utilities/converters/data2cards.dart';

class DataStore {
  List<ShopCategory> categories = [];
  List<CreditCard> cards = [];
  String serviceType;
  AppContext context;
  bool needRefresh;
  HttpsCallable addCardCallable;
  HttpsCallable addPromoCallable;
  HttpsCallable getCardsCallable;
  HttpsCallable removeCardCallable;
  HttpsCallable removePromoCallable;
  HttpsCallable deleteAccountCallable;
  CloudFunctions cloudFunc;
  DataStore(this.serviceType, this.context) {
    needRefresh = true;
    cloudFunc = CloudFunctions.instance;
    if (context.useEmulator) {
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

  Future<List<ShopCategory>> getShopCategories() async {
    BackendResponse status = await fetchCards();
    if (status.status == ResponseStatus.FAILURE) {
      print('fetch card failed');
      return [];
    }
    return getUniqueShoppingCategories(cards);
  }

  Future<BackendResponse> removeCard(CreditCard card) async {
    BackendResponse response =
        BackendResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      await removeCardCallable.call(<String, dynamic>{'id': card.id});
      response.status = ResponseStatus.SUCCEESS;
      response.msg = 'na';
      needRefresh = true;
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      print(err.toString());
      return response;
    }
  }

  Future<BackendResponse> fetchCards() async {
    BackendResponse response =
        BackendResponse(ResponseStatus.FAILURE, 'Not started');
    if (!needRefresh || kIsWeb) {
      response.status = ResponseStatus.SUCCEESS;
      response.msg = 'No need to fetch';
      return response;
    }
    try {
      HttpsCallableResult result = await getCardsCallable.call();
      List<CreditCard> fetchedCards = data2cards(result);
      cards = fetchedCards;
      response.status = ResponseStatus.SUCCEESS;
      response.msg = 'na';
      needRefresh = false;
      return response;
    } on CloudFunctionsException catch (cloudFuncError) {
      response.status = ResponseStatus.FAILURE;
      print('fetch card failed with cloud function error');
      print(cloudFuncError.code);
      print(cloudFuncError.message);
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      print(err.toString());
      return response;
    }
  }

  Future<void> forceRefresh() async {
    needRefresh = true;
    BackendResponse status = await fetchCards();
    if (status.status == ResponseStatus.FAILURE) {
      print('Refreshing data failed');
    }
  }

  Future<List<CreditCard>> getCards() async {
    BackendResponse status = await fetchCards();
    if (status.status == ResponseStatus.FAILURE) {
      return [];
    }
    return cards;
  }

  Future<BackendResponse> addCard(CreditCard card) async {
    BackendResponse response =
        BackendResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      HttpsCallableResult result = await addCardCallable.call(<String, dynamic>{
        'id': card.id,
        'name': card.name,
      });
      response.status = ResponseStatus.SUCCEESS;
      response.msg = result.toString();
      needRefresh = true;
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      return response;
    }
  }

  Future<BackendResponse> addCardTemplate(CreditCard card) async {
    /// TODO(tianhaoz95): this idealy should be a atmoic
    /// operation to avoid incomplete failure. Server side
    /// work is needed to make the change.
    BackendResponse response =
        BackendResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      await addCard(card);
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      return response;
    }
    try {
      for (CashbackPromo promo in card.promos) {
        await addPromo(card, promo);
      }
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      return response;
    }
    response.status = ResponseStatus.SUCCEESS;
    needRefresh = true;
    return response;
  }

  CreditCard renewCard(CreditCard card) {
    for (CreditCard searchCard in cards) {
      if (searchCard.id == card.id) {
        return searchCard;
      }
    }
    return card;
  }

  Future<List<CreditCard>> getRankedCards(ShopCategory category) async {
    BackendResponse status = await fetchCards();
    if (status.status == ResponseStatus.FAILURE) {
      return [];
    }
    rankCards(cards, category);
    return cards;
  }

  Future<BackendResponse> removePromo(RemovePromoMeta meta) async {
    CreditCard card = meta.card;
    CashbackPromo promo = meta.promo;
    BackendResponse response =
        BackendResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      HttpsCallableResult result =
          await removePromoCallable.call(<String, dynamic>{
        'cardUid': card.id,
        'promoId': promo.id,
      });
      response.status = ResponseStatus.SUCCEESS;
      response.msg = result.toString();
      needRefresh = true;
      await fetchCards();
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      return response;
    }
  }

  Future<BackendResponse> addPromo(CreditCard card, CashbackPromo promo) async {
    BackendResponse response =
        BackendResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      HttpsCallableResult result =
          await addPromoCallable.call(<String, dynamic>{
        'cardUid': card.id,
        'cardData': card.name,
        'promoName': promo.name,
        'promoId': promo.id,
        'promoType': promo.type,
        'promoStart': promo.start,
        'promoEnd': promo.end,
        'promoRepeat': promo.repeat,
        'promoRate': promo.rate,
        'promoCategoryName': promo.category.name,
        'promoCategoryId': promo.category.id,
      });
      response.status = ResponseStatus.SUCCEESS;
      response.msg = result.toString();
      needRefresh = true;
      await fetchCards();
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      return response;
    }
  }

  Future<BackendResponse> deleteAccount() async {
    BackendResponse response =
        BackendResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      await deleteAccountCallable.call();
      response.status = ResponseStatus.SUCCEESS;
      needRefresh = true;
      return response;
    } on CloudFunctionsException catch (cloudFuncError) {
      response.status = ResponseStatus.FAILURE;
      print('fetch card failed with cloud function error');
      print(cloudFuncError.code);
      print(cloudFuncError.message);
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      print(err.toString());
      return response;
    }
  }
}

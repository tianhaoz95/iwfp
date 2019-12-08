import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/fetcher.dart';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/utilities/card_ranker.dart';
import 'package:iwfpapp/services/utilities/category_counter.dart';
import 'package:iwfpapp/services/utilities/converters/data2cards.dart';

enum ResponseStatus {
  SUCCEESS,
  FAILURE,
}

class CloudFuncResponse {
  ResponseStatus status;
  String msg;
  CloudFuncResponse(this.status, this.msg);
}

class DataStore {
  List<ShopCategory> categories = [];
  List<CreditCard> cards = [];
  String serviceType;
  HttpsCallable addCardCallable;
  HttpsCallable addPromoCallable;
  HttpsCallable getCardsCallable;
  HttpsCallable removeCardCallable;
  HttpsCallable removePromoCallable;
  DataStore(this.serviceType) {
    addCardCallable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addCreditCard',
    );
    getCardsCallable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'getCreditCards',
    );
    removeCardCallable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'removeCreditCard',
    );
    addPromoCallable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addPromo',
    );
    removePromoCallable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'removePromo',
    );
  }

  Future<List<ShopCategory>> getShopCategories() async {
    CloudFuncResponse status = await fetchCards();
    if (status.status == ResponseStatus.FAILURE) {
      print('fetch card failed');
      return [];
    }
    return getUniqueShoppingCategories(cards);
  }

  Future<CloudFuncResponse> removeCard(CreditCard card) async {
    CloudFuncResponse response =
        CloudFuncResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      await removeCardCallable.call(<String, dynamic>{'cardUid': card.id});
      response.status = ResponseStatus.SUCCEESS;
      response.msg = 'na';
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      print(err.toString());
      return response;
    }
  }

  Future<CloudFuncResponse> fetchCards() async {
    /// TODO(tianhaoz95): fetch cards should not refresh every
    /// time. Instead, it should keep track of a dirty bit and
    /// only refresh when needed.
    CloudFuncResponse response =
        CloudFuncResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      HttpsCallableResult result = await getCardsCallable.call();
      List<CreditCard> fetchedCards = data2cards(result);
      cards = fetchedCards;
      response.status = ResponseStatus.SUCCEESS;
      response.msg = 'na';
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      print(err.toString());
      return response;
    }
  }

  Future<List<CreditCard>> getCards() async {
    CloudFuncResponse status = await fetchCards();
    if (status.status == ResponseStatus.FAILURE) {
      print('fetch card failed');
      return fetchAllCreditCards('tianhaoz95');
    }
    return cards;
  }

  Future<CloudFuncResponse> addCard(CreditCard card) async {
    CloudFuncResponse response =
        CloudFuncResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      HttpsCallableResult result = await addCardCallable.call(<String, dynamic>{
        'cardUid': card.id,
        'cardData': card.name,
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

  Future<CloudFuncResponse> addCardTemplate(CreditCard card) async {
    /// TODO(tianhaoz95): this idealy should be a atmoic
    /// operation to avoid incomplete failure. Server side
    /// work is needed to make the change.
    CloudFuncResponse response =
        CloudFuncResponse(ResponseStatus.FAILURE, 'Not started');
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
    CloudFuncResponse status = await fetchCards();
    if (status.status == ResponseStatus.FAILURE) {
      print('fetch card failed');
      return [];
    }
    rankCards(cards, category);
    return cards;
  }

  Future<CloudFuncResponse> removePromo(RemovePromoMeta meta) async {
    CreditCard card = meta.card;
    CashbackPromo promo = meta.promo;
    CloudFuncResponse response =
        CloudFuncResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      HttpsCallableResult result =
          await removePromoCallable.call(<String, dynamic>{
        'cardUid': card.id,
        'promoId': promo.id,
      });
      response.status = ResponseStatus.SUCCEESS;
      response.msg = result.toString();
      await fetchCards();
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      return response;
    }
  }

  Future<CloudFuncResponse> addPromo(
      CreditCard card, CashbackPromo promo) async {
    CloudFuncResponse response =
        CloudFuncResponse(ResponseStatus.FAILURE, 'Not started');
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
      await fetchCards();
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      return response;
    }
  }
}

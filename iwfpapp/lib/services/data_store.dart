import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/fetcher.dart';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:cloud_functions/cloud_functions.dart';
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

  Future<CloudFuncResponse> addPromo(CreditCard card, CashbackPromo promo) async {
    CloudFuncResponse response =
        CloudFuncResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      HttpsCallableResult result = await addPromoCallable.call(<String, dynamic>{
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
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      return response;
    }
  }
}

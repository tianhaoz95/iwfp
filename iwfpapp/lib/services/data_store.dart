import 'dart:convert';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:cloud_functions/cloud_functions.dart';

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
  HttpsCallable getCardsCallable;
  DataStore(this.serviceType) {
    addCardCallable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addCreditCard',
    );
    getCardsCallable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'getCreditCards',
    );
  }
  Future<CloudFuncResponse> getCards() async {
    print('getting cards');
    CloudFuncResponse response =
        CloudFuncResponse(ResponseStatus.FAILURE, 'Not started');
    try {
      HttpsCallableResult result = await getCardsCallable.call();
      print('got response');
      print(result.data);
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.msg = err.toString();
      print(err.toString());
      return response;
    }
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
}

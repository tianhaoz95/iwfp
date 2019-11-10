import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:cloud_functions/cloud_functions.dart';

enum ResponseStatus {
  SUCCEESS,
  FAILURE,
}

class CloudFuncResponse {
  ResponseStatus status;
  String errorMsg;
}

class DataStore {
  List<ShopCategory> categories = [];
  List<CreditCard> cards = [];
  String serviceType;
  HttpsCallable addCardCallable;
  DataStore(this.serviceType) {
    addCardCallable = CloudFunctions.instance.getHttpsCallable(
      functionName: 'addCreditCard',
    );
  }
  Future<CloudFuncResponse> addCard(CreditCard card) async {
    CloudFuncResponse response;
    Map<String, dynamic> req;
    req['cardUid'] = card.id;
    req['cardData'] = <String, dynamic>{
      'cardUid': card.id,
      'cardName': card.name,
    };
    try {
      await addCardCallable.call(req);
      response.status = ResponseStatus.SUCCEESS;
      response.errorMsg = 'na';
      return response;
    } catch (err) {
      response.status = ResponseStatus.FAILURE;
      response.errorMsg = err.toString();
      return response;
    }
  }
}

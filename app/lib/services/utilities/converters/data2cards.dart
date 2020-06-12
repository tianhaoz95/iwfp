import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/response.pbserver.dart';

/// Converts firebase http callable result to credit cards
List<CreditCard> data2cards(HttpsCallableResult rawResponse) {
  try {
    Map<String, dynamic> docs = Map<String, dynamic>.from(rawResponse.data);
    List<int> serializedProto = List<int>.from(docs['serialized']);
    GetCreditCardResponse response = GetCreditCardResponse.fromBuffer(serializedProto);
    return response.cards;
  } catch (err) {
    String errMsg = 'Error parsing cards: ' + err.toString();
    throw errMsg;
  }
}

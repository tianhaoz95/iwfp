import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/credit_card.dart';

List<CreditCard> data2cards(HttpsCallableResult rawResponse) {
  List<CreditCard> cards = [];
  Map<String, dynamic> docs = Map<String, dynamic>.from(rawResponse.data);
  docs.forEach((String cardId, dynamic cardDataRaw) {
    Map<String, dynamic> cardData = Map<String, dynamic>.from(cardDataRaw);
    String cardName = cardData['card_name'] as String;
    CreditCard card = CreditCard(cardName, cardId);
    cards.add(card);
  });
  return cards;
}
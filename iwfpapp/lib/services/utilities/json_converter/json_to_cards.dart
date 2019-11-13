import 'dart:convert';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/credit_card.dart';

List<CreditCard> json2cards(HttpsCallableResult rawResponse) {
  List<CreditCard> cards;
  Map<String, dynamic> jsonCards = json.decode(rawResponse.data.toString());
  jsonCards.forEach((String cardId, dynamic cardData) {
    Map<String, dynamic> jsonCardData = json.decode(cardData.toString());
    if (jsonCardData.containsKey('card_name')) {
      String cardName = jsonCardData['card_name'] as String;
      CreditCard card = CreditCard(cardName, cardId);
      cards.add(card);
    }
  });
  return cards;
}
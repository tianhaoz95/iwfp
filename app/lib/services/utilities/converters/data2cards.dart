import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';
import 'package:iwfpapp/services/utilities/converters/dynamic2rate.dart';

/// Converts dynamic map to credit cards
List<CreditCard> dict2cards(Map<String, dynamic> dict) {
  List<CreditCard> cards = [];
  if (dict != null) {
    dict.forEach((String cardId, dynamic cardDataRaw) {
      Map<String, dynamic> cardData = Map<String, dynamic>.from(cardDataRaw);
      String cardName = cardData['displayName'] as String;
      CreditCard card = createCreditCard(cardName, cardId);

      /// Refactor all the to be casting from JSON to a proto instead of
      /// dumb parsing.
      try {
        String officialUrl = cardData['officialUrl'] as String;
        card.officialUrl = officialUrl;
      } catch (err) {
        print('Error parsing official url');
      }
      if (cardData['promos'] != null) {
        Map<String, dynamic> promos =
            Map<String, dynamic>.from(cardData['promos']);
        if (promos != null) {
          promos.forEach((String promoId, dynamic promoDataRaw) {
            Map<String, dynamic> promoData =
                Map<String, dynamic>.from(promoDataRaw);
            Promotion promo = createPromotion(
              promoData['displayName'],
              promoData['id'],
              promoData['type'],
              promoData['startDate'],
              promoData['endDate'],
              promoData['repeatPattern'],
              dynamic2rate(promoData['rate']),
              createShoppingCategory(promoData['category']['displayName'],
                  promoData['category']['id']),
            );
            card.promotions.add(promo);
          });
        }
      }
      cards.add(card);
    });
  }
  return cards;
}

/// Converts json docs to credit cards
List<CreditCard> docs2cards(Map<String, dynamic> docs) {
  try {
    return dict2cards(docs);
  } catch (err) {
    print('Error paring cards: ' + err.toString());
    return [];
  }
}

/// Converts firebase http callable result to credit cards
List<CreditCard> data2cards(HttpsCallableResult rawResponse) {
  try {
    Map<String, dynamic> docs = Map<String, dynamic>.from(rawResponse.data);
    return docs2cards(docs);
  } catch (err) {
    String errMsg = 'Error parsing cards: ' + err.toString();
    throw errMsg;
  }
}

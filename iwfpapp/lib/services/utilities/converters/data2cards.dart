import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';

/// Converts dynamic map to credit cards
List<CreditCard> dict2cards(Map<String, dynamic> dict) {
  List<CreditCard> cards = [];
  if (dict != null) {
    dict.forEach((String cardId, dynamic cardDataRaw) {
      Map<String, dynamic> cardData = Map<String, dynamic>.from(cardDataRaw);
      String cardName = cardData['card_name'] as String;
      CreditCard card = CreditCard(cardName, cardId);
      if (cardData['promos'] != null) {
        Map<String, dynamic> promos =
            Map<String, dynamic>.from(cardData['promos']);
        if (promos != null) {
          promos.forEach((String promoId, dynamic promoDataRaw) {
            Map<String, dynamic> promoData =
                Map<String, dynamic>.from(promoDataRaw);
            CashbackPromo promo = CashbackPromo(
              promoData['promo_name'],
              promoData['promo_id'],
              promoData['promo_type'],
              promoData['promo_start'],
              promoData['promo_end'],
              promoData['promo_repeat_pattern'],
              int.parse(promoData['promo_rate']),
              ShopCategory(promoData['promo_category_name'],
                  promoData['promo_category_id']),
            );
            card.promos.add(promo);
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
    print('Error parsing cards: ' + err.toString());
    return [];
  }
}

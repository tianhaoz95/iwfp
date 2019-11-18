import 'package:cloud_functions/cloud_functions.dart';
import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/shop_category.dart';

List<CreditCard> data2cards(HttpsCallableResult rawResponse) {
  List<CreditCard> cards = [];
  Map<String, dynamic> docs = Map<String, dynamic>.from(rawResponse.data);
  if (docs != null) {
    docs.forEach((String cardId, dynamic cardDataRaw) {
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
              promoData['promo_rate'],
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

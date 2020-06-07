import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/interfaces/request.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';

class MockDataBackend extends DataBackend {
  Map<String, CreditCard> cardDatabase;

  MockDataBackend() : super() {
    cardDatabase = {};
  }

  @override
  Future<void> addCreditCardToDatabase(CreditCardCreationRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.cardData.id)) {
      throw 'card_exist';
    } else {
      cardDatabase[req.cardData.id] = req.cardData;
    }
  }

  @override
  Future<void> addPromitionToDatabase(PromotionAdditionRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.targetCardId)) {
      cardDatabase[req.targetCardId].promotions.add(req.promotionData);
    } else {
      throw 'card_not_found';
    }
  }

  @override
  Future<void> deleteAccountFromDatabase() async {
    await Future.delayed(Duration(milliseconds: 200));
    cardDatabase.clear();
  }

  @override
  Future<List<CreditCard>> fetchCreditCardsFromDatabase() async {
    await Future.delayed(Duration(milliseconds: 200));
    List<CreditCard> cards = [];
    for (CreditCard card in cardDatabase.values) {
      cards.add(card);
    }
    return cards;
  }

  @override
  Future<void> initCreditCardInDatabase(CreditCardCreationRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.cardData.id)) {
      throw 'card_exist';
    } else {
      cardDatabase[req.cardData.id] =
          createCreditCard(req.cardData.displayName, req.cardData.id);
    }
  }

  @override
  Future<void> initCreditCardWithTemplateInDatabase(
      CreditCardCreationRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.cardData.id)) {
      throw 'card_exist';
    } else {
      cardDatabase[req.cardData.id] = req.cardData;
    }
  }

  @override
  Future<void> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.cardId)) {
      cardDatabase.remove(req.cardId);
    } else {
      throw 'card_not_exist';
    }
  }

  @override
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.targetCardId)) {
      for (Promotion promo in cardDatabase[req.targetCardId].promotions) {
        if (promo.id == req.targetPromotionId) {
          cardDatabase[req.targetCardId].promotions.remove(promo);
          return;
        }
      }
      throw 'promo_not_found';
    } else {
      throw 'card_not_found';
    }
  }
}

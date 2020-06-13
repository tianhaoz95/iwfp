import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/interfaces/request.pb.dart';

class MockDataBackend extends DataBackend {
  Map<String, CreditCard> cardDatabase;

  MockDataBackend() : super() {
    cardDatabase = {};
  }

  @override
  Future<void> addCreditCardToDatabase(CreditCardCreationRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.cardData.id)) {
      throw Exception('The credit card has already existed');
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
      throw Exception('The credit card is not found');
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
      throw Exception('The credit card has already existed');
    } else {
      cardDatabase[req.cardData.id] = req.cardData;
    }
  }

  @override
  Future<void> initCreditCardWithTemplateInDatabase(
      CreditCardCreationRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.cardData.id)) {
      throw Exception('The credit card has already existed');
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
      throw Exception('The credit card is not found');
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
      throw Exception('The promotion is not found');
    } else {
      throw Exception('The credit card is not found');
    }
  }
}

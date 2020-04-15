import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';

class MockDataBackend extends DataBackend {
  Map<String, CreditCard> cardDatabase;

  MockDataBackend() : super() {
    cardDatabase = {};
  }

  @override
  Future<void> addCreditCardToDatabase(CreditCardAdditionRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.card.id)) {
      throw 'card_exist';
    } else {
      cardDatabase[req.card.id] = req.card;
    }
  }

  @override
  Future<void> addPromitionToDatabase(PromotionAdditionRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.target)) {
      cardDatabase[req.target].promos.add(req.promo);
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
  Future<void> initCreditCardInDatabase(CreditCardInitRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.card.id)) {
      throw 'card_exist';
    } else {
      cardDatabase[req.card.id] = req.card;
    }
  }

  @override
  Future<void> removeCreditCardFromDatabase(
      CreditCardRemovalRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.id)) {
      cardDatabase.remove(req.id);
    } else {
      throw 'card_not_exist';
    }
  }

  @override
  Future<void> removePromotionFromDatabase(PromotionRemovalRequest req) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (cardDatabase.containsKey(req.target)) {
      for (int i = 0; i < cardDatabase[req.target].promos.length; ++i) {
        if (cardDatabase[req.target].promos[i].id == req.id) {
          cardDatabase[req.target].promos.removeAt(i);
          return;
        }
      }
      throw 'promo_not_found';
    } else {
      throw 'card_not_found';
    }
  }
}

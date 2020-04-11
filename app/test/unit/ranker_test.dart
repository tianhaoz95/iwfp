import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/utilities/rankers/card_reward_ranker.dart';
import 'package:test/test.dart';

CreditCard generateCreditCard(String name, String id, List<double> rates) {
  CreditCard card = CreditCard(name, id);
  for (double rate in rates) {
    CashbackPromo promo = CashbackPromo('Coffee Shop', 'coffee_shop', 'sector',
        'na', 'na', 'const', rate, ShopCategory('Coffee Shop', 'coffee_shop'));
    card.promos.add(promo);
  }
  return card;
}

List<CreditCard> generateCreditCardsNoGenericPromo() {
  List<CreditCard> cards = [
    generateCreditCard('Card 1', 'card_1', [1]),
    generateCreditCard('Card 5', 'card_5', [5]),
    generateCreditCard('Card 4', 'card_4', [4]),
    generateCreditCard('Card 6', 'card_6', [6]),
    generateCreditCard('Card 3', 'card_3', [3]),
    generateCreditCard('Card 2', 'card_2', [2]),
    generateCreditCard('Card 7', 'card_7', [7]),
  ];
  return cards;
}

void main() {
  group('ranker tests', () {
    test('finds highest matching rate basic case', () {
      List<CreditCard> cards = generateCreditCardsNoGenericPromo();
      ShopCategory category = ShopCategory('Coffee Shop', 'coffee_shop');
      rankCards(cards, category);
      expect(cards[0].name, 'Card 7');
      expect(cards[1].name, 'Card 6');
      expect(cards[2].name, 'Card 5');
      expect(cards[3].name, 'Card 4');
      expect(cards[4].name, 'Card 3');
      expect(cards[5].name, 'Card 2');
      expect(cards[6].name, 'Card 1');
    });
  });
}

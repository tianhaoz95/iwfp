import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/ranker.dart';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:test/test.dart';

CreditCard generateCreditCard(String name, List<int> rates) {
  CreditCard card = CreditCard(name);
  for (int rate in rates) {
    CashbackPromo promo = CashbackPromo(
        'Coffee Shop', 'coffee_shop', 'sector', 'na', 'na', 'const', rate, ShopCategory('Coffee Shop', 'coffee_shop'));
    card.promos.add(promo);
  }
  return card;
}

List<CreditCard> generateCreditCardsNoGenericPromo() {
  List<CreditCard> cards = [
    generateCreditCard('Card 1', [1]),
    generateCreditCard('Card 5', [5]),
    generateCreditCard('Card 4', [4]),
    generateCreditCard('Card 6', [6]),
    generateCreditCard('Card 3', [3]),
    generateCreditCard('Card 2', [2]),
    generateCreditCard('Card 7', [7]),
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

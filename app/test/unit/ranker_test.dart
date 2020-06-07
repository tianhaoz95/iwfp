import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/interfaces/shopping_category.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';
import 'package:iwfpapp/services/utilities/rankers/card_reward_ranker.dart';
import 'package:test/test.dart';

CreditCard generateCreditCard(String name, String id, List<double> rates) {
  CreditCard card = createCreditCard(name, id);
  for (double rate in rates) {
    Promotion promo = createPromotion(
        'Coffee Shop',
        'coffee_shop',
        'sector',
        'na',
        'na',
        'const',
        rate,
        createShoppingCategory('Coffee Shop', 'coffee_shop'));
    card.promotions.add(promo);
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
      ShoppingCategory category =
          createShoppingCategory('Coffee Shop', 'coffee_shop');
      rankCards(cards, category);
      expect(cards[0].displayName, 'Card 7');
      expect(cards[1].displayName, 'Card 6');
      expect(cards[2].displayName, 'Card 5');
      expect(cards[3].displayName, 'Card 4');
      expect(cards[4].displayName, 'Card 3');
      expect(cards[5].displayName, 'Card 2');
      expect(cards[6].displayName, 'Card 1');
    });
  });
}

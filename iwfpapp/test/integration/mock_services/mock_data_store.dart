import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/utilities/category_counter.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/mock_cards.dart';

class MockDataStore extends Mock implements DataStore {
  List<CreditCard> cards = [];

  @override
  MockDataStore() {
    cards = getMockedCreditCards();
  }

  @override
  Future<CloudFuncResponse> addPromo(
      CreditCard card, CashbackPromo promo) async {
    CloudFuncResponse response =
        CloudFuncResponse(ResponseStatus.SUCCEESS, 'Mocked');
    return Future.delayed(Duration(seconds: 1), () => response);
  }

  @override
  Future<List<CreditCard>> getCards() async {
    return Future.delayed(Duration(seconds: 1), () => cards);
  }

  @override
  Future<List<ShopCategory>> getShopCategories() async {
    return Future.delayed(
        Duration(seconds: 1), () => getUniqueShoppingCategories(cards));
  }

  @override
  Future<List<CreditCard>> getRankedCards(ShopCategory category) async {
    return Future.delayed(Duration(seconds: 1), () => cards);
  }
}

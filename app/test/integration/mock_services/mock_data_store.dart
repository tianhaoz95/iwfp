import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/utilities/category_counter.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/mock_cards.dart';

class MockDataBackend extends Mock implements DataBackend {
  List<CreditCard> cards = [];

  @override
  MockDataBackend() {
    cards = getMockedCreditCards();
  }

  @override
  Future<BackendResponse> addPromotion(PromotionAdditionRequest req) async {
    BackendResponse response =
        BackendResponse(ResponseStatus.SUCCEESS, 'Mocked');
    return Future.delayed(Duration(seconds: 1), () => response);
  }

  @override
  Future<List<CreditCard>> getCreditCards() async {
    return Future.delayed(Duration(seconds: 1), () => cards);
  }

  @override
  Future<List<ShopCategory>> getShopCategories() async {
    return Future.delayed(
        Duration(seconds: 1), () => getUniqueShoppingCategories(cards));
  }

  @override
  Future<List<CreditCard>> getRankedCreditCards(ShopCategory category) async {
    return Future.delayed(Duration(seconds: 1), () => cards);
  }
}

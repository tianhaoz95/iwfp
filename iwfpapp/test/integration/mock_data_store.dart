import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:mockito/mockito.dart';

class MockDataStore extends Mock implements DataStore {
  @override
  Future<List<CreditCard>> getCards() async {
    return Future.delayed(Duration(seconds: 1), () => []);
  }

  @override
  Future<List<ShopCategory>> getShopCategories() async {
    return [];
  }

  @override
  Future<List<CreditCard>> getRankedCards(ShopCategory category) async {
    return [];
  }
}

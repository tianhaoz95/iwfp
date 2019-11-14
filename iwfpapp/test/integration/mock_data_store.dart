import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:mockito/mockito.dart';

class MockDataStore extends Mock implements DataStore {
  @override
  Future<List<CreditCard>> getCards() async {
    return Future.delayed(Duration(seconds: 1), () => []);
  }
}

import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base.dart';

class UseHttpDataBackend extends DataBackend {
  UseHttpDataBackend(AppContext appContext) : super(appContext);

  @override
  Future<BackendResponse> addCreditCardToDatabase(CreditCardAdditionRequest req) async {
    return BackendResponse(ResponseStatus.SUCCEESS, 'na');
  }

  @override
  Future<BackendResponse> addPromitionToDatabase(PromotionAdditionRequest req) async {
    return BackendResponse(ResponseStatus.SUCCEESS, 'na');
  }

  @override
  Future<BackendResponse> deleteAccountFromDatabase() async {
    return BackendResponse(ResponseStatus.SUCCEESS, 'na');
  }

  @override
  Future<List<CreditCard>> fetchCreditCardsFromDatabase() async {
    return [];
  }

  @override
  Future<BackendResponse> initCreditCardInDatabase(CreditCardInitRequest req) async {
    return BackendResponse(ResponseStatus.SUCCEESS, 'na');
  }

  @override
  Future<BackendResponse> removeCreditCardFromDatabase(CreditCardRemovalRequest req) async {
    return BackendResponse(ResponseStatus.SUCCEESS, 'na');
  }

  @override
  Future<BackendResponse> removePromotionFromDatabase(PromotionRemovalRequest req) async {
    return BackendResponse(ResponseStatus.SUCCEESS, 'na');
  }
  
}
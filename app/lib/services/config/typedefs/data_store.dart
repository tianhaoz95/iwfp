import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';

/// The data fetching status
enum DataBackendStatus { LOADING, AVAILABLE, OUTDATED, ERROR }

/// The stages in deleting an account
/// TODO(#453): merge this with [DataBackendStatus]
enum DeleteAccountStatus {
  PENDING,
  DELETEING,
  DELETED,
  ERROR,
}

enum DataBackendType {
  IN_APP,
  HTTPS,
}

enum ResponseStatus {
  SUCCEESS,
  FAILURE,
}

class CreditCardInitRequest {
  CreditCard card;
  CreditCardInitRequest(this.card);
}

class CreditCardAdditionRequest {
  CreditCard card;
  CreditCardAdditionRequest(this.card);
}

class PromotionAdditionRequest {
  CashbackPromo promo;
  String target;
  PromotionAdditionRequest(this.target, this.promo);
}

class CreditCardRemovalRequest {
  String id;
  CreditCardRemovalRequest(this.id);
}

class PromotionRemovalRequest {
  String target;
  String id;
  PromotionRemovalRequest(this.target, this.id);
}

class BackendResponse {
  ResponseStatus status;
  String msg;
  BackendResponse(this.status, this.msg);
}

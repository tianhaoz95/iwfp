import 'package:iwfpapp/services/config/consts/error_messages.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';

ValidationResponse isValidPromoId(String promoId) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (promoId.contains(' ')) {
    response.valid = false;
    response.messages.add(promoIdHasSpaceErrorMessage);
  }
  return response;
}

ValidationResponse isValidPromoInfo(
    String name,
    String id,
    String type,
    String start,
    String end,
    String repeat,
    int rate,
    String categoryName,
    String categoryId) {
  ValidationResponse response = ValidationResponse(valid: true);
  return response;
}

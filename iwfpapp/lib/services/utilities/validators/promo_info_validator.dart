import 'package:iwfpapp/services/config/typedefs/validation_response.dart';

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

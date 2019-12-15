import 'package:iwfpapp/services/config/consts/error_messages.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';

ValidationResponse isValidCategoryId(String id) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (id.isEmpty) {
    response.valid = false;
    response.messages.add(categoryIdEmptyErrorMessage);
  }
  return response;
}

ValidationResponse isValidCategoryName(String name) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (name.isEmpty) {
    response.valid = false;
    response.messages.add(categoryNameEmptyErrorMessage);
  }
  return response;
}

ValidationResponse isValidCategoryInfo(String name, String id) {
  ValidationResponse response = ValidationResponse(valid: true);
  return response;
}

import 'package:iwfpapp/services/config/consts/error_messages.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';

ValidationResponse isValidPassword(String pwd) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (pwd.isEmpty) {
    response.valid = false;
    response.messages.add(passwordEmptyErrorMessage);
  }
  if (pwd.contains(' ')) {
    response.valid = false;
    response.messages.add(passwordContainSpaceErrorMessage);
  }
  if (pwd.length < 6) {
    response.valid = false;
    response.messages.add(passwordTooShortErrorMessage);
  }
  return response;
}

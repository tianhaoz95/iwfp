import 'package:iwfpapp/services/config/consts/error_messages.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';

ValidationResponse isValidEmail(String email) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (email.isEmpty) {
    response.valid = false;
    response.messages.add(emailEmptyErrorMessage);
  }
  if (email.contains(' ')) {
    response.valid = false;
    response.messages.add(emailContainSpaceErrorMessage);
  }
  RegExp emailMatcher =
      RegExp(r"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$");
  if (!email.contains(emailMatcher)) {
    response.valid = false;
    response.messages.add(emailInvalidFormatErrorMessage);
  }
  return response;
}

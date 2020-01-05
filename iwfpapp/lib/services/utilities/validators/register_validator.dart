import 'package:iwfpapp/services/config/consts/error_messages.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/utilities/validators/email_validator.dart';
import 'package:iwfpapp/services/utilities/validators/password_validator.dart';
import 'package:iwfpapp/services/utilities/validators/response_merger.dart';

ValidationResponse isValidRegisterInfo(
    String email, String pwd, String confirmation) {
  ValidationResponse matchResponse = ValidationResponse(valid: true);
  if (pwd != confirmation) {
    matchResponse.valid = false;
    matchResponse.messages.add(passwordConfirmationNotMatchErrorMessage);
  }
  ValidationResponse finalResponse = mergeValidationResponses([
    matchResponse,
    isValidPassword(pwd),
    isValidEmail(email),
  ]);
  return finalResponse;
}

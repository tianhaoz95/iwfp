import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/utilities/validators/email_validator.dart';
import 'package:iwfpapp/services/utilities/validators/password_validator.dart';
import 'package:iwfpapp/services/utilities/validators/response_merger.dart';

ValidationResponse isValidSignInInfo(String email, String pwd) {
  ValidationResponse finalResponse = mergeValidationResponses([
    isValidPassword(pwd),
    isValidEmail(email),
  ]);
  return finalResponse;
}
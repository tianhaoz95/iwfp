import 'package:iwfpapp/services/config/typedefs/validation_response.dart';

ValidationResponse mergeValidationResponses(
    List<ValidationResponse> responses) {
  ValidationResponse finalResponse = ValidationResponse(valid: true);
  for (ValidationResponse response in responses) {
    finalResponse.valid = finalResponse.valid && response.valid;
    for (String message in response.messages) {
      finalResponse.messages.add(message);
    }
  }
  return finalResponse;
}

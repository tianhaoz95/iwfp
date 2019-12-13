import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/utilities/validators/response_merger.dart';

ValidationResponse isValidCardId(String cardId) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (cardId.contains(' ')) {
    print('card id has space');
    response.valid = false;
    response.messages.add('Credit card ID cannot contain space');
  }
  return response;
}

ValidationResponse isValidCardName(String cardName) {
  ValidationResponse response = ValidationResponse(valid: true);
  return response;
}

ValidationResponse isValidCardInfo(String cardName, String cardId) {
  ValidationResponse response = mergeValidationResponses([
    isValidCardName(cardName),
    isValidCardId(cardId),
  ]);
  print(response.valid);
  return response;
}
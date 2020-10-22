import 'package:iwfpapp/services/config/consts/error_messages.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/utilities/validators/response_merger.dart';

ValidationResponse isValidCardId(String cardId) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (cardId.isEmpty) {
    response.valid = false;
    response.messages.add(cardIdEmptyErrorMessage);
  }
  if (cardId.contains(' ')) {
    response.valid = false;
    response.messages.add(cardIdHasSpaceErrorMessage);
  }
  return response;
}

ValidationResponse isValidCardName(String cardName) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (cardName.isEmpty) {
    response.valid = false;
    response.messages.add(cardNameEmptyErrorMessage);
  }
  return response;
}

ValidationResponse isValidCardInfo(String cardName, String cardId) {
  ValidationResponse response = mergeValidationResponses([
    isValidCardName(cardName),
    isValidCardId(cardId),
  ]);
  return response;
}

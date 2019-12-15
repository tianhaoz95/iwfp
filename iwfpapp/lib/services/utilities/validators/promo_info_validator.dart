import 'package:iwfpapp/services/config/consts/error_messages.dart';
import 'package:iwfpapp/services/config/typedefs/promo_types.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/utilities/converters/str2promo_type.dart';
import 'package:iwfpapp/services/utilities/validators/category_info_validator.dart';
import 'package:iwfpapp/services/utilities/validators/response_merger.dart';

ValidationResponse isValidPromoId(String promoId) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (promoId.isEmpty) {
    response.valid = false;
    response.messages.add(promoIdEmptyErrorMessage);
  }
  if (promoId.contains(' ')) {
    response.valid = false;
    response.messages.add(promoIdHasSpaceErrorMessage);
  }
  return response;
}

ValidationResponse isValidPromoName(String promoName) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (promoName.isEmpty) {
    response.valid = false;
    response.messages.add(promoNameEmptyErrorMessage);
  }
  return response;
}

ValidationResponse isValidPromoType(String promoTypeStr) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (promoTypeStr.isEmpty) {
    response.valid = false;
    response.messages.add(promoTypeEmptyErrorMessage);
  }
  CashbackPromoType promoType = str2promoType(promoTypeStr);
  if (promoType == CashbackPromoType.UNKNOWN) {
    response.valid = false;
    response.messages.add(promoTypeUnknownErrorMessage);
  }
  return response;
}

ValidationResponse isValidPromoStart(String promoStart) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (promoStart.isEmpty) {
    response.valid = false;
    response.messages.add(promoStartEmptyErrorMessage);
  }
  return response;
}

ValidationResponse isValidPromoEnd(String promoEnd) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (promoEnd.isEmpty) {
    response.valid = false;
    response.messages.add(promoEndEmptyErrorMessage);
  }
  return response;
}

ValidationResponse isValidPromoRepeat(String promoRepeat) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (promoRepeat.isEmpty) {
    response.valid = false;
    response.messages.add(promoRepeatEmptyErrorMessage);
  }
  return response;
}

ValidationResponse isValidPromoRate(String promoRate) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (promoRate.isEmpty) {
    response.valid = false;
    response.messages.add(promoRateEmptyErrorMessage);
  }
  try {
    int.parse(promoRate);
  } catch (err) {
    response.valid = false;
    response.messages.add(promoRateNotIntErrorMessage);
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
    String rate,
    String categoryName,
    String categoryId) {
  ValidationResponse response = mergeValidationResponses([
    isValidPromoId(id),
    isValidPromoName(name),
    isValidPromoType(type),
    isValidPromoStart(start),
    isValidPromoEnd(end),
    isValidPromoRepeat(repeat),
    isValidPromoRate(rate),
    isValidCategoryInfo(categoryName, categoryId),
  ]);
  return response;
}

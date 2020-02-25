import 'package:iwfpapp/services/config/consts/error_messages.dart';
import 'package:iwfpapp/services/config/typedefs/promo_types.dart';
import 'package:iwfpapp/services/config/typedefs/repeat_pattern.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/utilities/converters/str2date_of_current_year.dart';
import 'package:iwfpapp/services/utilities/converters/str2promo_repeat.dart';
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

ValidationResponse isValidConstRepeatStartEnd(String start, String end) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (start != 'Not Applicable') {
    response.valid = false;
    response.messages.add(promoConstStartNotNaErrorMessage);
  }
  if (end != 'Not Applicable') {
    response.valid = false;
    response.messages.add(promoConstEndNotNaErrorMessage);
  }
  return response;
}

bool isValidMonthDateFormat(String dateStr) {
  RegExp dateMatcher = RegExp(r"^[0-9]{2}/[0-9]{2}$");
  return dateStr.contains(dateMatcher);
}

ValidationResponse isValidAnnualRepeatStartEnd(String start, String end) {
  ValidationResponse response = ValidationResponse(valid: true);
  if (isValidMonthDateFormat(start) && isValidMonthDateFormat(end)) {
    DateTime startDate = str2dateOfCurrentYear(start);
    DateTime endDate = str2dateOfCurrentYear(end);
    if (endDate.isBefore(startDate)) {
      response.valid = false;
      response.messages.add(promoAnnualEndBeforeStartErrorMessage);
    }
  } else {
    response.valid = false;
    response.messages.add(promoAnnualStartEndIncorrectFormatErrorMessage);
  }
  return response;
}

ValidationResponse isValidPromoRepeat(
    String promoRepeat, String promoStart, String promoEnd) {
  ValidationResponse response = ValidationResponse(valid: true);
  response = mergeValidationResponses(
      [response, isValidPromoStart(promoStart), isValidPromoEnd(promoEnd)]);
  if (promoRepeat.isEmpty) {
    response.valid = false;
    response.messages.add(promoRepeatEmptyErrorMessage);
  }
  CashbackPromoRepeatPattern repeat = str2promoRepeat(promoRepeat);
  switch (repeat) {
    case CashbackPromoRepeatPattern.CONST:
      response = mergeValidationResponses(
          [response, isValidConstRepeatStartEnd(promoStart, promoEnd)]);
      break;
    case CashbackPromoRepeatPattern.ANNUAL:
      response = mergeValidationResponses(
          [response, isValidAnnualRepeatStartEnd(promoStart, promoEnd)]);
      break;
    default:
      response.valid = false;
      response.messages.add(promoRepeatUnknownErrorMessage);
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
    double.parse(promoRate);
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
    isValidPromoRepeat(repeat, start, end),
    isValidPromoRate(rate),
    isValidCategoryInfo(categoryName, categoryId),
  ]);
  return response;
}

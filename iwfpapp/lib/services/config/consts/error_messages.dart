/// Error message about promotion information validation
final String promoIdHasSpaceErrorMessage = 'Promotion ID cannot contain space.';
final String promoIdEmptyErrorMessage = 'Promotion ID cannot be empty.';
final String promoNameEmptyErrorMessage = 'Promotion name cannot be empty.';
final String promoTypeEmptyErrorMessage = 'Promotion type cannot be empty.';
final String promoTypeUnknownErrorMessage = 'Promotion type is unknwon.';
final String promoStartEmptyErrorMessage =
    'Promotion start date cannot be empty.';
final String promoConstStartNotNaErrorMessage =
    'Promotion end date should be na if repeat type is const';
final String promoEndEmptyErrorMessage = 'Promotion end date cannot be empty.';
final String promoConstEndNotNaErrorMessage =
    'Promotion end date should be na if repeat type is const';
final String promoAnnualStartEndIncorrectFormatErrorMessage =
    'Promotion start/end date not correctly formated. Should be MM/DD';
final String promoAnnualEndBeforeStartErrorMessage =
    'Promotion should not back date (end date is before start date) for annual repeat pattern.';
final String promoRepeatEmptyErrorMessage =
    'Promotion repeat pattern cannot be empty.';
final String promoRepeatUnknownErrorMessage =
    'Promotion repeat pattern is unknown';
final String promoRateNotIntErrorMessage =
    'Promotion rate should be an integer.';
final String promoRateEmptyErrorMessage = 'Promotion rate cannot be empty.';

/// Error message about shopping category information validate
final String categoryNameEmptyErrorMessage = 'Category name cannot be empty';
final String categoryIdEmptyErrorMessage = 'Category ID cannot be empty';

/// Error message about credit card information validation
final String cardIdHasSpaceErrorMessage =
    'Credit card ID cannot contain space.';
final String cardIdEmptyErrorMessage = 'Credit card ID cannot be empty';
final String cardNameEmptyErrorMessage = 'Credit card Name cannot be empty';

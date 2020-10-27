///
//  Generated code. Do not modify.
//  source: request.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const CreditCardCreationRequest$json = const {
  '1': 'CreditCardCreationRequest',
  '2': const [
    const {'1': 'valid', '3': 1, '4': 1, '5': 8, '10': 'valid'},
    const {
      '1': 'card_data',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CreditCard',
      '10': 'cardData'
    },
  ],
};

const CreditCardUpdateRequest$json = const {
  '1': 'CreditCardUpdateRequest',
  '2': const [
    const {'1': 'valid', '3': 1, '4': 1, '5': 8, '10': 'valid'},
    const {
      '1': 'updated_card_data',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.CreditCard',
      '10': 'updatedCardData'
    },
  ],
};

const CreditCardRemovalRequest$json = const {
  '1': 'CreditCardRemovalRequest',
  '2': const [
    const {'1': 'valid', '3': 1, '4': 1, '5': 8, '10': 'valid'},
    const {'1': 'card_id', '3': 2, '4': 1, '5': 9, '10': 'cardId'},
  ],
};

const PromotionAdditionRequest$json = const {
  '1': 'PromotionAdditionRequest',
  '2': const [
    const {'1': 'valid', '3': 1, '4': 1, '5': 8, '10': 'valid'},
    const {'1': 'target_card_id', '3': 2, '4': 1, '5': 9, '10': 'targetCardId'},
    const {
      '1': 'promotion_data',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Promotion',
      '10': 'promotionData'
    },
  ],
};

const PromotionRemovalRequest$json = const {
  '1': 'PromotionRemovalRequest',
  '2': const [
    const {'1': 'valid', '3': 1, '4': 1, '5': 8, '10': 'valid'},
    const {'1': 'target_card_id', '3': 2, '4': 1, '5': 9, '10': 'targetCardId'},
    const {
      '1': 'target_promotion_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'targetPromotionId'
    },
  ],
};

const PromotionUpdateRequest$json = const {
  '1': 'PromotionUpdateRequest',
  '2': const [
    const {'1': 'target_card_id', '3': 1, '4': 1, '5': 9, '10': 'targetCardId'},
    const {
      '1': 'updated_promotion_data',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.Promotion',
      '10': 'updatedPromotionData'
    },
  ],
};

const HttpBasedRequest$json = const {
  '1': 'HttpBasedRequest',
  '2': const [
    const {'1': 'require_auth', '3': 1, '4': 1, '5': 8, '10': 'requireAuth'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    const {
      '1': 'credit_card_creation_request',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.CreditCardCreationRequest',
      '9': 0,
      '10': 'creditCardCreationRequest'
    },
    const {
      '1': 'credit_card_update_request',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.CreditCardUpdateRequest',
      '9': 0,
      '10': 'creditCardUpdateRequest'
    },
    const {
      '1': 'credit_card_removal_request',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.CreditCardRemovalRequest',
      '9': 0,
      '10': 'creditCardRemovalRequest'
    },
    const {
      '1': 'promotion_addition_request',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.PromotionAdditionRequest',
      '9': 0,
      '10': 'promotionAdditionRequest'
    },
    const {
      '1': 'promotion_removal_request',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.PromotionRemovalRequest',
      '9': 0,
      '10': 'promotionRemovalRequest'
    },
    const {
      '1': 'promotion_update_request',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.PromotionUpdateRequest',
      '9': 0,
      '10': 'promotionUpdateRequest'
    },
  ],
  '8': const [
    const {'1': 'request'},
  ],
};

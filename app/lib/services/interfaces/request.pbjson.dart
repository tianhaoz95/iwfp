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

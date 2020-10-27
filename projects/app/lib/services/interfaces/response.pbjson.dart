///
//  Generated code. Do not modify.
//  source: response.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const GetCreditCardResponse$json = const {
  '1': 'GetCreditCardResponse',
  '2': const [
    const {
      '1': 'cards',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.CreditCard',
      '10': 'cards'
    },
  ],
};

const GenericResponse$json = const {
  '1': 'GenericResponse',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 9, '10': 'msg'},
  ],
};

const HttpBasedResponse$json = const {
  '1': 'HttpBasedResponse',
  '2': const [
    const {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.HttpBasedResponse.Status',
      '10': 'status'
    },
    const {'1': 'status_code', '3': 2, '4': 1, '5': 5, '10': 'statusCode'},
    const {
      '1': 'error',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.HttpBasedResponse.Error',
      '10': 'error'
    },
    const {
      '1': 'generic_response',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.GenericResponse',
      '9': 0,
      '10': 'genericResponse'
    },
    const {
      '1': 'get_credit_card_response',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.GetCreditCardResponse',
      '9': 0,
      '10': 'getCreditCardResponse'
    },
  ],
  '3': const [HttpBasedResponse_Error$json],
  '4': const [HttpBasedResponse_Status$json],
  '8': const [
    const {'1': 'response'},
  ],
};

const HttpBasedResponse_Error$json = const {
  '1': 'Error',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'detail', '3': 2, '4': 1, '5': 9, '10': 'detail'},
  ],
};

const HttpBasedResponse_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'SUCCESS', '2': 0},
    const {'1': 'ERROR', '2': 1},
    const {'1': 'UNKNOWN', '2': 2},
  ],
};

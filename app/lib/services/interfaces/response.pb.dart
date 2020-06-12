///
//  Generated code. Do not modify.
//  source: response.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'credit_card.pb.dart' as $2;

class GetCreditCardResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetCreditCardResponse', createEmptyInstance: create)
    ..pc<$2.CreditCard>(1, 'cards', $pb.PbFieldType.PM, subBuilder: $2.CreditCard.create)
    ..hasRequiredFields = false
  ;

  GetCreditCardResponse._() : super();
  factory GetCreditCardResponse() => create();
  factory GetCreditCardResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCreditCardResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetCreditCardResponse clone() => GetCreditCardResponse()..mergeFromMessage(this);
  GetCreditCardResponse copyWith(void Function(GetCreditCardResponse) updates) => super.copyWith((message) => updates(message as GetCreditCardResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCreditCardResponse create() => GetCreditCardResponse._();
  GetCreditCardResponse createEmptyInstance() => create();
  static $pb.PbList<GetCreditCardResponse> createRepeated() => $pb.PbList<GetCreditCardResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCreditCardResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCreditCardResponse>(create);
  static GetCreditCardResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.CreditCard> get cards => $_getList(0);
}


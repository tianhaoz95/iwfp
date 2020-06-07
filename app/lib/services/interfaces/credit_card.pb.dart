///
//  Generated code. Do not modify.
//  source: credit_card.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'promotion.pb.dart' as $1;

class CreditCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('CreditCard', createEmptyInstance: create)
        ..aOS(1, 'id')
        ..aOS(2, 'displayName')
        ..pc<$1.Promotion>(3, 'promotions', $pb.PbFieldType.PM,
            subBuilder: $1.Promotion.create)
        ..hasRequiredFields = false;

  CreditCard._() : super();
  factory CreditCard() => create();
  factory CreditCard.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditCard.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  CreditCard clone() => CreditCard()..mergeFromMessage(this);
  CreditCard copyWith(void Function(CreditCard) updates) =>
      super.copyWith((message) => updates(message as CreditCard));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreditCard create() => CreditCard._();
  CreditCard createEmptyInstance() => create();
  static $pb.PbList<CreditCard> createRepeated() => $pb.PbList<CreditCard>();
  @$core.pragma('dart2js:noInline')
  static CreditCard getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditCard>(create);
  static CreditCard _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$1.Promotion> get promotions => $_getList(2);
}

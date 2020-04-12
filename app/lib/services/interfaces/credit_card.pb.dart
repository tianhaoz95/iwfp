///
//  Generated code. Do not modify.
//  source: credit_card.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'promotion.pb.dart' as $1;

class ProtoCreditCard extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ProtoCreditCard', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'displayName')
    ..pc<$1.ProtoPromotion>(3, 'promotions', $pb.PbFieldType.PM, subBuilder: $1.ProtoPromotion.create)
    ..hasRequiredFields = false
  ;

  ProtoCreditCard._() : super();
  factory ProtoCreditCard() => create();
  factory ProtoCreditCard.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoCreditCard.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ProtoCreditCard clone() => ProtoCreditCard()..mergeFromMessage(this);
  ProtoCreditCard copyWith(void Function(ProtoCreditCard) updates) => super.copyWith((message) => updates(message as ProtoCreditCard));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoCreditCard create() => ProtoCreditCard._();
  ProtoCreditCard createEmptyInstance() => create();
  static $pb.PbList<ProtoCreditCard> createRepeated() => $pb.PbList<ProtoCreditCard>();
  @$core.pragma('dart2js:noInline')
  static ProtoCreditCard getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoCreditCard>(create);
  static ProtoCreditCard _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$1.ProtoPromotion> get promotions => $_getList(2);
}


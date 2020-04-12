///
//  Generated code. Do not modify.
//  source: promotion.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'shopping_category.pb.dart' as $0;

class ProtoPromotion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ProtoPromotion', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'displayName')
    ..aOM<$0.ProtoShoppingCategory>(3, 'category', subBuilder: $0.ProtoShoppingCategory.create)
    ..hasRequiredFields = false
  ;

  ProtoPromotion._() : super();
  factory ProtoPromotion() => create();
  factory ProtoPromotion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoPromotion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ProtoPromotion clone() => ProtoPromotion()..mergeFromMessage(this);
  ProtoPromotion copyWith(void Function(ProtoPromotion) updates) => super.copyWith((message) => updates(message as ProtoPromotion));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoPromotion create() => ProtoPromotion._();
  ProtoPromotion createEmptyInstance() => create();
  static $pb.PbList<ProtoPromotion> createRepeated() => $pb.PbList<ProtoPromotion>();
  @$core.pragma('dart2js:noInline')
  static ProtoPromotion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoPromotion>(create);
  static ProtoPromotion _defaultInstance;

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
  $0.ProtoShoppingCategory get category => $_getN(2);
  @$pb.TagNumber(3)
  set category($0.ProtoShoppingCategory v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCategory() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategory() => clearField(3);
  @$pb.TagNumber(3)
  $0.ProtoShoppingCategory ensureCategory() => $_ensure(2);
}


///
//  Generated code. Do not modify.
//  source: shopping_category.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ShoppingCategory extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ShoppingCategory', createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'displayName')
    ..hasRequiredFields = false
  ;

  ShoppingCategory._() : super();
  factory ShoppingCategory() => create();
  factory ShoppingCategory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShoppingCategory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ShoppingCategory clone() => ShoppingCategory()..mergeFromMessage(this);
  ShoppingCategory copyWith(void Function(ShoppingCategory) updates) => super.copyWith((message) => updates(message as ShoppingCategory));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShoppingCategory create() => ShoppingCategory._();
  ShoppingCategory createEmptyInstance() => create();
  static $pb.PbList<ShoppingCategory> createRepeated() => $pb.PbList<ShoppingCategory>();
  @$core.pragma('dart2js:noInline')
  static ShoppingCategory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShoppingCategory>(create);
  static ShoppingCategory _defaultInstance;

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
}


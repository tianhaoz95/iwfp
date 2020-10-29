///
//  Generated code. Do not modify.
//  source: promotion.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'shopping_category.pb.dart' as $0;

class Promotion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Promotion',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'displayName')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'startDate')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'endDate')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'type')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'repeatPattern')
    ..a<$core.double>(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'rate',
        $pb.PbFieldType.OF)
    ..aOM<$0.ShoppingCategory>(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category',
        subBuilder: $0.ShoppingCategory.create)
    ..hasRequiredFields = false;

  Promotion._() : super();
  factory Promotion() => create();
  factory Promotion.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Promotion.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Promotion clone() => Promotion()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Promotion copyWith(void Function(Promotion) updates) =>
      super.copyWith((message) =>
          updates(message as Promotion)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Promotion create() => Promotion._();
  Promotion createEmptyInstance() => create();
  static $pb.PbList<Promotion> createRepeated() => $pb.PbList<Promotion>();
  @$core.pragma('dart2js:noInline')
  static Promotion getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Promotion>(create);
  static Promotion _defaultInstance;

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
  $core.String get startDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set startDate($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasStartDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartDate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get endDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set endDate($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasEndDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndDate() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get repeatPattern => $_getSZ(5);
  @$pb.TagNumber(6)
  set repeatPattern($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRepeatPattern() => $_has(5);
  @$pb.TagNumber(6)
  void clearRepeatPattern() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get rate => $_getN(6);
  @$pb.TagNumber(7)
  set rate($core.double v) {
    $_setFloat(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRate() => $_has(6);
  @$pb.TagNumber(7)
  void clearRate() => clearField(7);

  @$pb.TagNumber(8)
  $0.ShoppingCategory get category => $_getN(7);
  @$pb.TagNumber(8)
  set category($0.ShoppingCategory v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasCategory() => $_has(7);
  @$pb.TagNumber(8)
  void clearCategory() => clearField(8);
  @$pb.TagNumber(8)
  $0.ShoppingCategory ensureCategory() => $_ensure(7);
}

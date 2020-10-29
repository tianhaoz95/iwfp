///
//  Generated code. Do not modify.
//  source: request.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'credit_card.pb.dart' as $2;
import 'promotion.pb.dart' as $1;

class CreditCardCreationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreditCardCreationRequest',
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'valid')
    ..aOM<$2.CreditCard>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardData',
        subBuilder: $2.CreditCard.create)
    ..hasRequiredFields = false;

  CreditCardCreationRequest._() : super();
  factory CreditCardCreationRequest() => create();
  factory CreditCardCreationRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditCardCreationRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreditCardCreationRequest clone() =>
      CreditCardCreationRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreditCardCreationRequest copyWith(
          void Function(CreditCardCreationRequest) updates) =>
      super.copyWith((message) => updates(message
          as CreditCardCreationRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreditCardCreationRequest create() => CreditCardCreationRequest._();
  CreditCardCreationRequest createEmptyInstance() => create();
  static $pb.PbList<CreditCardCreationRequest> createRepeated() =>
      $pb.PbList<CreditCardCreationRequest>();
  @$core.pragma('dart2js:noInline')
  static CreditCardCreationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditCardCreationRequest>(create);
  static CreditCardCreationRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get valid => $_getBF(0);
  @$pb.TagNumber(1)
  set valid($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearValid() => clearField(1);

  @$pb.TagNumber(2)
  $2.CreditCard get cardData => $_getN(1);
  @$pb.TagNumber(2)
  set cardData($2.CreditCard v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCardData() => $_has(1);
  @$pb.TagNumber(2)
  void clearCardData() => clearField(2);
  @$pb.TagNumber(2)
  $2.CreditCard ensureCardData() => $_ensure(1);
}

class CreditCardUpdateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreditCardUpdateRequest',
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'valid')
    ..aOM<$2.CreditCard>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'updatedCardData',
        subBuilder: $2.CreditCard.create)
    ..hasRequiredFields = false;

  CreditCardUpdateRequest._() : super();
  factory CreditCardUpdateRequest() => create();
  factory CreditCardUpdateRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditCardUpdateRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreditCardUpdateRequest clone() =>
      CreditCardUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreditCardUpdateRequest copyWith(
          void Function(CreditCardUpdateRequest) updates) =>
      super.copyWith((message) => updates(
          message as CreditCardUpdateRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreditCardUpdateRequest create() => CreditCardUpdateRequest._();
  CreditCardUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<CreditCardUpdateRequest> createRepeated() =>
      $pb.PbList<CreditCardUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static CreditCardUpdateRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditCardUpdateRequest>(create);
  static CreditCardUpdateRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get valid => $_getBF(0);
  @$pb.TagNumber(1)
  set valid($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearValid() => clearField(1);

  @$pb.TagNumber(2)
  $2.CreditCard get updatedCardData => $_getN(1);
  @$pb.TagNumber(2)
  set updatedCardData($2.CreditCard v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUpdatedCardData() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatedCardData() => clearField(2);
  @$pb.TagNumber(2)
  $2.CreditCard ensureUpdatedCardData() => $_ensure(1);
}

class CreditCardRemovalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreditCardRemovalRequest',
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'valid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardId')
    ..hasRequiredFields = false;

  CreditCardRemovalRequest._() : super();
  factory CreditCardRemovalRequest() => create();
  factory CreditCardRemovalRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditCardRemovalRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreditCardRemovalRequest clone() =>
      CreditCardRemovalRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreditCardRemovalRequest copyWith(
          void Function(CreditCardRemovalRequest) updates) =>
      super.copyWith((message) => updates(message
          as CreditCardRemovalRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreditCardRemovalRequest create() => CreditCardRemovalRequest._();
  CreditCardRemovalRequest createEmptyInstance() => create();
  static $pb.PbList<CreditCardRemovalRequest> createRepeated() =>
      $pb.PbList<CreditCardRemovalRequest>();
  @$core.pragma('dart2js:noInline')
  static CreditCardRemovalRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditCardRemovalRequest>(create);
  static CreditCardRemovalRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get valid => $_getBF(0);
  @$pb.TagNumber(1)
  set valid($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearValid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cardId => $_getSZ(1);
  @$pb.TagNumber(2)
  set cardId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCardId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCardId() => clearField(2);
}

class CreditCardFetchRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreditCardFetchRequest',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cardId')
    ..hasRequiredFields = false;

  CreditCardFetchRequest._() : super();
  factory CreditCardFetchRequest() => create();
  factory CreditCardFetchRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditCardFetchRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreditCardFetchRequest clone() =>
      CreditCardFetchRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreditCardFetchRequest copyWith(
          void Function(CreditCardFetchRequest) updates) =>
      super.copyWith((message) => updates(
          message as CreditCardFetchRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreditCardFetchRequest create() => CreditCardFetchRequest._();
  CreditCardFetchRequest createEmptyInstance() => create();
  static $pb.PbList<CreditCardFetchRequest> createRepeated() =>
      $pb.PbList<CreditCardFetchRequest>();
  @$core.pragma('dart2js:noInline')
  static CreditCardFetchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditCardFetchRequest>(create);
  static CreditCardFetchRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cardId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cardId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCardId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCardId() => clearField(1);
}

class PromotionAdditionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PromotionAdditionRequest',
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'valid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetCardId')
    ..aOM<$1.Promotion>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'promotionData',
        subBuilder: $1.Promotion.create)
    ..hasRequiredFields = false;

  PromotionAdditionRequest._() : super();
  factory PromotionAdditionRequest() => create();
  factory PromotionAdditionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PromotionAdditionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PromotionAdditionRequest clone() =>
      PromotionAdditionRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PromotionAdditionRequest copyWith(
          void Function(PromotionAdditionRequest) updates) =>
      super.copyWith((message) => updates(message
          as PromotionAdditionRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PromotionAdditionRequest create() => PromotionAdditionRequest._();
  PromotionAdditionRequest createEmptyInstance() => create();
  static $pb.PbList<PromotionAdditionRequest> createRepeated() =>
      $pb.PbList<PromotionAdditionRequest>();
  @$core.pragma('dart2js:noInline')
  static PromotionAdditionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PromotionAdditionRequest>(create);
  static PromotionAdditionRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get valid => $_getBF(0);
  @$pb.TagNumber(1)
  set valid($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearValid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get targetCardId => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetCardId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTargetCardId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetCardId() => clearField(2);

  @$pb.TagNumber(3)
  $1.Promotion get promotionData => $_getN(2);
  @$pb.TagNumber(3)
  set promotionData($1.Promotion v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPromotionData() => $_has(2);
  @$pb.TagNumber(3)
  void clearPromotionData() => clearField(3);
  @$pb.TagNumber(3)
  $1.Promotion ensurePromotionData() => $_ensure(2);
}

class PromotionRemovalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PromotionRemovalRequest',
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'valid')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetCardId')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetPromotionId')
    ..hasRequiredFields = false;

  PromotionRemovalRequest._() : super();
  factory PromotionRemovalRequest() => create();
  factory PromotionRemovalRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PromotionRemovalRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PromotionRemovalRequest clone() =>
      PromotionRemovalRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PromotionRemovalRequest copyWith(
          void Function(PromotionRemovalRequest) updates) =>
      super.copyWith((message) => updates(
          message as PromotionRemovalRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PromotionRemovalRequest create() => PromotionRemovalRequest._();
  PromotionRemovalRequest createEmptyInstance() => create();
  static $pb.PbList<PromotionRemovalRequest> createRepeated() =>
      $pb.PbList<PromotionRemovalRequest>();
  @$core.pragma('dart2js:noInline')
  static PromotionRemovalRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PromotionRemovalRequest>(create);
  static PromotionRemovalRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get valid => $_getBF(0);
  @$pb.TagNumber(1)
  set valid($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearValid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get targetCardId => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetCardId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTargetCardId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetCardId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get targetPromotionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set targetPromotionId($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTargetPromotionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTargetPromotionId() => clearField(3);
}

class PromotionUpdateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PromotionUpdateRequest',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'targetCardId')
    ..aOM<$1.Promotion>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'updatedPromotionData',
        subBuilder: $1.Promotion.create)
    ..hasRequiredFields = false;

  PromotionUpdateRequest._() : super();
  factory PromotionUpdateRequest() => create();
  factory PromotionUpdateRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PromotionUpdateRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PromotionUpdateRequest clone() =>
      PromotionUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PromotionUpdateRequest copyWith(
          void Function(PromotionUpdateRequest) updates) =>
      super.copyWith((message) => updates(
          message as PromotionUpdateRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PromotionUpdateRequest create() => PromotionUpdateRequest._();
  PromotionUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<PromotionUpdateRequest> createRepeated() =>
      $pb.PbList<PromotionUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static PromotionUpdateRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PromotionUpdateRequest>(create);
  static PromotionUpdateRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get targetCardId => $_getSZ(0);
  @$pb.TagNumber(1)
  set targetCardId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTargetCardId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetCardId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Promotion get updatedPromotionData => $_getN(1);
  @$pb.TagNumber(2)
  set updatedPromotionData($1.Promotion v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUpdatedPromotionData() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatedPromotionData() => clearField(2);
  @$pb.TagNumber(2)
  $1.Promotion ensureUpdatedPromotionData() => $_ensure(1);
}

class UserRemovalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserRemovalRequest',
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'username')
    ..hasRequiredFields = false;

  UserRemovalRequest._() : super();
  factory UserRemovalRequest() => create();
  factory UserRemovalRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserRemovalRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserRemovalRequest clone() => UserRemovalRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserRemovalRequest copyWith(void Function(UserRemovalRequest) updates) =>
      super.copyWith((message) => updates(
          message as UserRemovalRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserRemovalRequest create() => UserRemovalRequest._();
  UserRemovalRequest createEmptyInstance() => create();
  static $pb.PbList<UserRemovalRequest> createRepeated() =>
      $pb.PbList<UserRemovalRequest>();
  @$core.pragma('dart2js:noInline')
  static UserRemovalRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserRemovalRequest>(create);
  static UserRemovalRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);
}

enum HttpBasedRequest_Request {
  creditCardCreationRequest,
  creditCardUpdateRequest,
  creditCardRemovalRequest,
  promotionAdditionRequest,
  promotionRemovalRequest,
  promotionUpdateRequest,
  notSet
}

class HttpBasedRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, HttpBasedRequest_Request>
      _HttpBasedRequest_RequestByTag = {
    3: HttpBasedRequest_Request.creditCardCreationRequest,
    4: HttpBasedRequest_Request.creditCardUpdateRequest,
    5: HttpBasedRequest_Request.creditCardRemovalRequest,
    6: HttpBasedRequest_Request.promotionAdditionRequest,
    7: HttpBasedRequest_Request.promotionRemovalRequest,
    8: HttpBasedRequest_Request.promotionUpdateRequest,
    0: HttpBasedRequest_Request.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'HttpBasedRequest',
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 6, 7, 8])
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'requireAuth')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'token')
    ..aOM<CreditCardCreationRequest>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creditCardCreationRequest',
        subBuilder: CreditCardCreationRequest.create)
    ..aOM<CreditCardUpdateRequest>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creditCardUpdateRequest',
        subBuilder: CreditCardUpdateRequest.create)
    ..aOM<CreditCardRemovalRequest>(
        5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'creditCardRemovalRequest',
        subBuilder: CreditCardRemovalRequest.create)
    ..aOM<PromotionAdditionRequest>(
        6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'promotionAdditionRequest',
        subBuilder: PromotionAdditionRequest.create)
    ..aOM<PromotionRemovalRequest>(
        7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'promotionRemovalRequest',
        subBuilder: PromotionRemovalRequest.create)
    ..aOM<PromotionUpdateRequest>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'promotionUpdateRequest', subBuilder: PromotionUpdateRequest.create)
    ..hasRequiredFields = false;

  HttpBasedRequest._() : super();
  factory HttpBasedRequest() => create();
  factory HttpBasedRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HttpBasedRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  HttpBasedRequest clone() => HttpBasedRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  HttpBasedRequest copyWith(void Function(HttpBasedRequest) updates) =>
      super.copyWith((message) => updates(
          message as HttpBasedRequest)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HttpBasedRequest create() => HttpBasedRequest._();
  HttpBasedRequest createEmptyInstance() => create();
  static $pb.PbList<HttpBasedRequest> createRepeated() =>
      $pb.PbList<HttpBasedRequest>();
  @$core.pragma('dart2js:noInline')
  static HttpBasedRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HttpBasedRequest>(create);
  static HttpBasedRequest _defaultInstance;

  HttpBasedRequest_Request whichRequest() =>
      _HttpBasedRequest_RequestByTag[$_whichOneof(0)];
  void clearRequest() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get requireAuth => $_getBF(0);
  @$pb.TagNumber(1)
  set requireAuth($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRequireAuth() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequireAuth() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);

  @$pb.TagNumber(3)
  CreditCardCreationRequest get creditCardCreationRequest => $_getN(2);
  @$pb.TagNumber(3)
  set creditCardCreationRequest(CreditCardCreationRequest v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCreditCardCreationRequest() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreditCardCreationRequest() => clearField(3);
  @$pb.TagNumber(3)
  CreditCardCreationRequest ensureCreditCardCreationRequest() => $_ensure(2);

  @$pb.TagNumber(4)
  CreditCardUpdateRequest get creditCardUpdateRequest => $_getN(3);
  @$pb.TagNumber(4)
  set creditCardUpdateRequest(CreditCardUpdateRequest v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCreditCardUpdateRequest() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreditCardUpdateRequest() => clearField(4);
  @$pb.TagNumber(4)
  CreditCardUpdateRequest ensureCreditCardUpdateRequest() => $_ensure(3);

  @$pb.TagNumber(5)
  CreditCardRemovalRequest get creditCardRemovalRequest => $_getN(4);
  @$pb.TagNumber(5)
  set creditCardRemovalRequest(CreditCardRemovalRequest v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCreditCardRemovalRequest() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreditCardRemovalRequest() => clearField(5);
  @$pb.TagNumber(5)
  CreditCardRemovalRequest ensureCreditCardRemovalRequest() => $_ensure(4);

  @$pb.TagNumber(6)
  PromotionAdditionRequest get promotionAdditionRequest => $_getN(5);
  @$pb.TagNumber(6)
  set promotionAdditionRequest(PromotionAdditionRequest v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasPromotionAdditionRequest() => $_has(5);
  @$pb.TagNumber(6)
  void clearPromotionAdditionRequest() => clearField(6);
  @$pb.TagNumber(6)
  PromotionAdditionRequest ensurePromotionAdditionRequest() => $_ensure(5);

  @$pb.TagNumber(7)
  PromotionRemovalRequest get promotionRemovalRequest => $_getN(6);
  @$pb.TagNumber(7)
  set promotionRemovalRequest(PromotionRemovalRequest v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPromotionRemovalRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearPromotionRemovalRequest() => clearField(7);
  @$pb.TagNumber(7)
  PromotionRemovalRequest ensurePromotionRemovalRequest() => $_ensure(6);

  @$pb.TagNumber(8)
  PromotionUpdateRequest get promotionUpdateRequest => $_getN(7);
  @$pb.TagNumber(8)
  set promotionUpdateRequest(PromotionUpdateRequest v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasPromotionUpdateRequest() => $_has(7);
  @$pb.TagNumber(8)
  void clearPromotionUpdateRequest() => clearField(8);
  @$pb.TagNumber(8)
  PromotionUpdateRequest ensurePromotionUpdateRequest() => $_ensure(7);
}

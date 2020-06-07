///
//  Generated code. Do not modify.
//  source: request.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'credit_card.pb.dart' as $2;
import 'promotion.pb.dart' as $1;

class CreditCardCreationRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('CreditCardCreationRequest', createEmptyInstance: create)
        ..aOB(1, 'valid')
        ..aOM<$2.CreditCard>(2, 'cardData', subBuilder: $2.CreditCard.create)
        ..hasRequiredFields = false;

  CreditCardCreationRequest._() : super();
  factory CreditCardCreationRequest() => create();
  factory CreditCardCreationRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditCardCreationRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  CreditCardCreationRequest clone() =>
      CreditCardCreationRequest()..mergeFromMessage(this);
  CreditCardCreationRequest copyWith(
          void Function(CreditCardCreationRequest) updates) =>
      super
          .copyWith((message) => updates(message as CreditCardCreationRequest));
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CreditCardUpdateRequest',
      createEmptyInstance: create)
    ..aOB(1, 'valid')
    ..aOM<$2.CreditCard>(2, 'updatedCardData', subBuilder: $2.CreditCard.create)
    ..hasRequiredFields = false;

  CreditCardUpdateRequest._() : super();
  factory CreditCardUpdateRequest() => create();
  factory CreditCardUpdateRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditCardUpdateRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  CreditCardUpdateRequest clone() =>
      CreditCardUpdateRequest()..mergeFromMessage(this);
  CreditCardUpdateRequest copyWith(
          void Function(CreditCardUpdateRequest) updates) =>
      super.copyWith((message) => updates(message as CreditCardUpdateRequest));
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
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('CreditCardRemovalRequest', createEmptyInstance: create)
        ..aOB(1, 'valid')
        ..aOS(2, 'cardId')
        ..hasRequiredFields = false;

  CreditCardRemovalRequest._() : super();
  factory CreditCardRemovalRequest() => create();
  factory CreditCardRemovalRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreditCardRemovalRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  CreditCardRemovalRequest clone() =>
      CreditCardRemovalRequest()..mergeFromMessage(this);
  CreditCardRemovalRequest copyWith(
          void Function(CreditCardRemovalRequest) updates) =>
      super.copyWith((message) => updates(message as CreditCardRemovalRequest));
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

class PromotionAdditionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('PromotionAdditionRequest', createEmptyInstance: create)
        ..aOB(1, 'valid')
        ..aOS(2, 'targetCardId')
        ..aOM<$1.Promotion>(3, 'promotionData', subBuilder: $1.Promotion.create)
        ..hasRequiredFields = false;

  PromotionAdditionRequest._() : super();
  factory PromotionAdditionRequest() => create();
  factory PromotionAdditionRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PromotionAdditionRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  PromotionAdditionRequest clone() =>
      PromotionAdditionRequest()..mergeFromMessage(this);
  PromotionAdditionRequest copyWith(
          void Function(PromotionAdditionRequest) updates) =>
      super.copyWith((message) => updates(message as PromotionAdditionRequest));
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
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('PromotionRemovalRequest', createEmptyInstance: create)
        ..aOB(1, 'valid')
        ..aOS(2, 'targetCardId')
        ..aOS(3, 'targetPromotionId')
        ..hasRequiredFields = false;

  PromotionRemovalRequest._() : super();
  factory PromotionRemovalRequest() => create();
  factory PromotionRemovalRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PromotionRemovalRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  PromotionRemovalRequest clone() =>
      PromotionRemovalRequest()..mergeFromMessage(this);
  PromotionRemovalRequest copyWith(
          void Function(PromotionRemovalRequest) updates) =>
      super.copyWith((message) => updates(message as PromotionRemovalRequest));
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
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('PromotionUpdateRequest', createEmptyInstance: create)
        ..aOS(1, 'targetCardId')
        ..aOM<$1.Promotion>(2, 'updatedPromotionData',
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
  PromotionUpdateRequest clone() =>
      PromotionUpdateRequest()..mergeFromMessage(this);
  PromotionUpdateRequest copyWith(
          void Function(PromotionUpdateRequest) updates) =>
      super.copyWith((message) => updates(message as PromotionUpdateRequest));
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

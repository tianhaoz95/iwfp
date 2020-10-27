///
//  Generated code. Do not modify.
//  source: response.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'credit_card.pb.dart' as $2;

import 'response.pbenum.dart';

export 'response.pbenum.dart';

class GetCreditCardResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('GetCreditCardResponse', createEmptyInstance: create)
        ..pc<$2.CreditCard>(1, 'cards', $pb.PbFieldType.PM,
            subBuilder: $2.CreditCard.create)
        ..hasRequiredFields = false;

  GetCreditCardResponse._() : super();
  factory GetCreditCardResponse() => create();
  factory GetCreditCardResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetCreditCardResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  GetCreditCardResponse clone() =>
      GetCreditCardResponse()..mergeFromMessage(this);
  GetCreditCardResponse copyWith(
          void Function(GetCreditCardResponse) updates) =>
      super.copyWith((message) => updates(message as GetCreditCardResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCreditCardResponse create() => GetCreditCardResponse._();
  GetCreditCardResponse createEmptyInstance() => create();
  static $pb.PbList<GetCreditCardResponse> createRepeated() =>
      $pb.PbList<GetCreditCardResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCreditCardResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCreditCardResponse>(create);
  static GetCreditCardResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$2.CreditCard> get cards => $_getList(0);
}

class GenericResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('GenericResponse', createEmptyInstance: create)
        ..aOS(1, 'msg')
        ..hasRequiredFields = false;

  GenericResponse._() : super();
  factory GenericResponse() => create();
  factory GenericResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GenericResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  GenericResponse clone() => GenericResponse()..mergeFromMessage(this);
  GenericResponse copyWith(void Function(GenericResponse) updates) =>
      super.copyWith((message) => updates(message as GenericResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenericResponse create() => GenericResponse._();
  GenericResponse createEmptyInstance() => create();
  static $pb.PbList<GenericResponse> createRepeated() =>
      $pb.PbList<GenericResponse>();
  @$core.pragma('dart2js:noInline')
  static GenericResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenericResponse>(create);
  static GenericResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);
}

class HttpBasedResponse_Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('HttpBasedResponse.Error', createEmptyInstance: create)
        ..aOS(1, 'title')
        ..aOS(2, 'detail')
        ..hasRequiredFields = false;

  HttpBasedResponse_Error._() : super();
  factory HttpBasedResponse_Error() => create();
  factory HttpBasedResponse_Error.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HttpBasedResponse_Error.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  HttpBasedResponse_Error clone() =>
      HttpBasedResponse_Error()..mergeFromMessage(this);
  HttpBasedResponse_Error copyWith(
          void Function(HttpBasedResponse_Error) updates) =>
      super.copyWith((message) => updates(message as HttpBasedResponse_Error));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HttpBasedResponse_Error create() => HttpBasedResponse_Error._();
  HttpBasedResponse_Error createEmptyInstance() => create();
  static $pb.PbList<HttpBasedResponse_Error> createRepeated() =>
      $pb.PbList<HttpBasedResponse_Error>();
  @$core.pragma('dart2js:noInline')
  static HttpBasedResponse_Error getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HttpBasedResponse_Error>(create);
  static HttpBasedResponse_Error _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get detail => $_getSZ(1);
  @$pb.TagNumber(2)
  set detail($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDetail() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetail() => clearField(2);
}

enum HttpBasedResponse_Response {
  genericResponse,
  getCreditCardResponse,
  notSet
}

class HttpBasedResponse extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, HttpBasedResponse_Response>
      _HttpBasedResponse_ResponseByTag = {
    4: HttpBasedResponse_Response.genericResponse,
    5: HttpBasedResponse_Response.getCreditCardResponse,
    0: HttpBasedResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('HttpBasedResponse', createEmptyInstance: create)
        ..oo(0, [4, 5])
        ..e<HttpBasedResponse_Status>(1, 'status', $pb.PbFieldType.OE,
            defaultOrMaker: HttpBasedResponse_Status.SUCCESS,
            valueOf: HttpBasedResponse_Status.valueOf,
            enumValues: HttpBasedResponse_Status.values)
        ..a<$core.int>(2, 'statusCode', $pb.PbFieldType.O3)
        ..aOM<HttpBasedResponse_Error>(3, 'error',
            subBuilder: HttpBasedResponse_Error.create)
        ..aOM<GenericResponse>(4, 'genericResponse',
            subBuilder: GenericResponse.create)
        ..aOM<GetCreditCardResponse>(5, 'getCreditCardResponse',
            subBuilder: GetCreditCardResponse.create)
        ..hasRequiredFields = false;

  HttpBasedResponse._() : super();
  factory HttpBasedResponse() => create();
  factory HttpBasedResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory HttpBasedResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  HttpBasedResponse clone() => HttpBasedResponse()..mergeFromMessage(this);
  HttpBasedResponse copyWith(void Function(HttpBasedResponse) updates) =>
      super.copyWith((message) => updates(message as HttpBasedResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static HttpBasedResponse create() => HttpBasedResponse._();
  HttpBasedResponse createEmptyInstance() => create();
  static $pb.PbList<HttpBasedResponse> createRepeated() =>
      $pb.PbList<HttpBasedResponse>();
  @$core.pragma('dart2js:noInline')
  static HttpBasedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HttpBasedResponse>(create);
  static HttpBasedResponse _defaultInstance;

  HttpBasedResponse_Response whichResponse() =>
      _HttpBasedResponse_ResponseByTag[$_whichOneof(0)];
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  HttpBasedResponse_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(HttpBasedResponse_Status v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get statusCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set statusCode($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusCode() => clearField(2);

  @$pb.TagNumber(3)
  HttpBasedResponse_Error get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(HttpBasedResponse_Error v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
  @$pb.TagNumber(3)
  HttpBasedResponse_Error ensureError() => $_ensure(2);

  @$pb.TagNumber(4)
  GenericResponse get genericResponse => $_getN(3);
  @$pb.TagNumber(4)
  set genericResponse(GenericResponse v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasGenericResponse() => $_has(3);
  @$pb.TagNumber(4)
  void clearGenericResponse() => clearField(4);
  @$pb.TagNumber(4)
  GenericResponse ensureGenericResponse() => $_ensure(3);

  @$pb.TagNumber(5)
  GetCreditCardResponse get getCreditCardResponse => $_getN(4);
  @$pb.TagNumber(5)
  set getCreditCardResponse(GetCreditCardResponse v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasGetCreditCardResponse() => $_has(4);
  @$pb.TagNumber(5)
  void clearGetCreditCardResponse() => clearField(5);
  @$pb.TagNumber(5)
  GetCreditCardResponse ensureGetCreditCardResponse() => $_ensure(4);
}

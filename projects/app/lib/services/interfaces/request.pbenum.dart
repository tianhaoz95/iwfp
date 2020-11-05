///
//  Generated code. Do not modify.
//  source: request.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class HttpBasedVersionInfo_ServiceType extends $pb.ProtobufEnum {
  static const HttpBasedVersionInfo_ServiceType FIREBASE =
      HttpBasedVersionInfo_ServiceType._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'FIREBASE');
  static const HttpBasedVersionInfo_ServiceType MOCK =
      HttpBasedVersionInfo_ServiceType._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'MOCK');

  static const $core.List<HttpBasedVersionInfo_ServiceType> values =
      <HttpBasedVersionInfo_ServiceType>[
    FIREBASE,
    MOCK,
  ];

  static final $core.Map<$core.int, HttpBasedVersionInfo_ServiceType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static HttpBasedVersionInfo_ServiceType valueOf($core.int value) =>
      _byValue[value];

  const HttpBasedVersionInfo_ServiceType._($core.int v, $core.String n)
      : super(v, n);
}

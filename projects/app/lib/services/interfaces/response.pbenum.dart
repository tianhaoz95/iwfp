///
//  Generated code. Do not modify.
//  source: response.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class HttpBasedResponse_Status extends $pb.ProtobufEnum {
  static const HttpBasedResponse_Status SUCCESS = HttpBasedResponse_Status._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SUCCESS');
  static const HttpBasedResponse_Status ERROR = HttpBasedResponse_Status._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ERROR');
  static const HttpBasedResponse_Status UNKNOWN = HttpBasedResponse_Status._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UNKNOWN');

  static const $core.List<HttpBasedResponse_Status> values =
      <HttpBasedResponse_Status>[
    SUCCESS,
    ERROR,
    UNKNOWN,
  ];

  static final $core.Map<$core.int, HttpBasedResponse_Status> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static HttpBasedResponse_Status valueOf($core.int value) => _byValue[value];

  const HttpBasedResponse_Status._($core.int v, $core.String n) : super(v, n);
}

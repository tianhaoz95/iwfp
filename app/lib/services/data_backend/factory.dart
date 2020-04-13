import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/data_backend/in_app.dart';
import 'package:iwfpapp/services/data_backend/use_http.dart';

DataBackend getDataBackend(
    BackendType type) {
  switch (type) {
    case BackendType.IN_APP:
      return InAppDataBackend();
    case BackendType.USE_HTTP:
      return UseHttpDataBackend();
    default:
      return InAppDataBackend();
  }
}

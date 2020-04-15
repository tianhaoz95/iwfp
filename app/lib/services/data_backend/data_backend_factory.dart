import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/data_backend/http_data_backend.dart';
import 'package:iwfpapp/services/data_backend/in_app_data_backend.dart';

DataBackend getDataBackend(BackendType type) {
  switch (type) {
    case BackendType.IN_APP:
      return InAppDataBackend();
    case BackendType.USE_HTTP:
      return UseHttpDataBackend();
    default:
      return InAppDataBackend();
  }
}

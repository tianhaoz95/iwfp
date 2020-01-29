import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/data_backend/in_app.dart';
import 'package:iwfpapp/services/data_backend/use_http.dart';

DataBackend getDataBackend(BackendType type, AppContext appContext) {
  switch (type) {
    case BackendType.IN_APP:
      return InAppDataBackend(appContext);
    case BackendType.USE_HTTP:
      return UseHttpDataBackend(appContext);
    default:
      return InAppDataBackend(appContext);
  }
}

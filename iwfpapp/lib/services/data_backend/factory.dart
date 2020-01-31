import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/data_backend/in_app.dart';
import 'package:iwfpapp/services/data_backend/use_http.dart';

DataBackend getDataBackend(BackendType type, AppContext appContext, AppAuth appAuth) {
  switch (type) {
    case BackendType.IN_APP:
      return InAppDataBackend(appContext, appAuth);
    case BackendType.USE_HTTP:
      return UseHttpDataBackend(appContext, appAuth);
    default:
      return InAppDataBackend(appContext, appAuth);
  }
}

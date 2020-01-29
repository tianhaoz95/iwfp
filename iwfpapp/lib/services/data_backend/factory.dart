import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/context.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/data_backend/inapp.dart';

DataBackend getDataBackend(BackendType type, AppContext appContext) {
  switch (type) {
    case BackendType.IN_APP:
      DataBackend backend = InAppDataBackend(appContext);
      return backend;
    default:
      DataBackend backend = InAppDataBackend(appContext);
      return backend;
  }
}

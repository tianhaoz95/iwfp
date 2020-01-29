import 'package:iwfpapp/services/context.dart';
import 'package:iwfpapp/services/data_store/base.dart';
import 'package:iwfpapp/services/data_store/inapp.dart';

DataBackend getDataBackend(String type, AppContext appContext) {
  switch (type) {
    case 'inapp':
      DataBackend backend = InAppDataBackend(appContext);
      return backend;
    default:
      DataBackend backend = InAppDataBackend(appContext);
      return backend;
  }
}

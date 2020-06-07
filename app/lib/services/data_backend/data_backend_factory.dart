import 'package:iwfpapp/services/config/typedefs/backend.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/data_backend/dumb_data_backend.dart';
import 'package:iwfpapp/services/data_backend/emulator_data_backend.dart';
import 'package:iwfpapp/services/data_backend/error_data_backend.dart';
import 'package:iwfpapp/services/data_backend/in_app_data_backend.dart';
import 'package:iwfpapp/services/data_backend/mock_data_backend.dart';

DataBackend getDataBackend(BackendType type) {
  switch (type) {
    case BackendType.IN_APP:
      return InAppDataBackend();
    case BackendType.EMULATOR:
      return EmulatorDataBackend();
    case BackendType.MOCK:
      return MockDataBackend();
    case BackendType.DUMB:
      return DumbDataBackend();
    case BackendType.ERROR:
      return ErrorDataBackend();
    default:
      return InAppDataBackend();
  }
}

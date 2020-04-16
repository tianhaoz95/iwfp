import 'package:iwfpapp/services/data_backend/in_app_data_backend.dart';

class EmulatorDataBackend extends InAppDataBackend {
  EmulatorDataBackend() : super() {
    cloudFunc.useFunctionsEmulator(origin: 'http://localhost:5001');
  }
}

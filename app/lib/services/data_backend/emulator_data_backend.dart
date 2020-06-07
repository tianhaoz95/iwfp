import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/data_backend/in_app_data_backend.dart';

class EmulatorDataBackend extends InAppDataBackend {
  EmulatorDataBackend() : super() {
    // Use http://localhost:5001 for non-Android and http://10.0.2.2:5001 for Android
    if (defaultTargetPlatform == TargetPlatform.android) {
      cloudFunc.useFunctionsEmulator(origin: 'http://10.0.2.2:5001');
    } else {
      cloudFunc.useFunctionsEmulator(origin: 'http://localhost:5001');
    }
  }
}

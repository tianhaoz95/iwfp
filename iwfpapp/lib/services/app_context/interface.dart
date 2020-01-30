import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/config/typedefs/runtime_types.dart';

class AppContext {
  bool isDev = false;
  bool useEmulator = false;
  AppContext({bool emulator}) {
    setInitialDevMode();
    if (emulator != null) {
      useEmulator = emulator;
    }
  }

  void setInitialDevMode() {
    assert(() {
      isDev = true;
      return true;
    }());
  }

  bool isDevMode() {
    return isDev;
  }

  void setRunningMode(bool nextVal) {
    isDev = nextVal;
  }

  RuntimeType getRuntimeType() {
    if (kIsWeb) {
      return RuntimeType.WEB;
    }
    return RuntimeType.MOBILE;
  }

  String devifyString(String msg) {
    return msg;
  }
}

import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/config/typedefs/runtime_types.dart';

class AppContext extends ChangeNotifier {
  bool isDev = false;
  AppContext() {
    setInitialDevMode();
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

  bool isDeveloper(String email) {
    return email == 'jacksonzhou666@gmail.com';
  }
}

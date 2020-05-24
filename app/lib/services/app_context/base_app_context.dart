import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/config/typedefs/runtime_types.dart';

abstract class AppContext extends ChangeNotifier {
  bool isDev;
  bool allowDynamicLink;
  AppContext({this.allowDynamicLink = true}) {
    setInitialDevMode();
  }

  void setInitialDevMode() {
    assert(() {
      isDev = true;
      return true;
    }());
  }

  bool getAllowDynamicLink() {
    return allowDynamicLink;
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

  bool allowGoogleSignIn() {
    return false;
  }

  bool allowGitHubSignIn() {
    return false;
  }

  bool allowContinueAsGuest() {
    return false;
  }

  bool needRemoteConfig();
}

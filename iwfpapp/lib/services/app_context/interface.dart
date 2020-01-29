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

  String devifyString(String msg) {
    if (isDev) {
      return '(Debug Mode) ' + msg;
    } else {
      return msg;
    }
  }
}

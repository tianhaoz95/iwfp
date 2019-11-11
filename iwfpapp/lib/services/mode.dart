class RunningMode {
  bool isDev = false;
  RunningMode() {
    /**
     * This is used to find out if the app is
     * running under debug mode because assert
     * only run in debug mode.
     */
    assert(() {
      /**
       * When the callback function is called
       * it means the app is running in debug
       * mode, so set isDev flag to true.
       */
      isDev = true;
      /**
       * This is necessary because otherwise
       * the assertion will fail.
       */
      return true;
    }());
  }

  String devifyString(String msg) {
    if (isDev) {
      return '(Debug Mode) ' + msg;
    } else {
      return msg;
    }
  }
}
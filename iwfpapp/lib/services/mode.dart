class RunningMode {
  bool isDev;
  RunningMode() {
    assert(() {
      isDev = true;
    }());
  }
}
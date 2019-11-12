import 'package:iwfpapp/services/mode.dart';
import 'package:mockito/mockito.dart';

class MockRunningMode extends Mock implements RunningMode {
  @override
  String devifyString(String msg) {
    return msg;
  }
  @override
  bool isDevMode() {
    return false;
  }
}

import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:mockito/mockito.dart';

class MockAppContext extends Mock implements AppContext {
  @override
  String devifyString(String msg) {
    return msg;
  }

  @override
  bool isDevMode() {
    return false;
  }
}

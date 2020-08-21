import 'package:iwfpapp/services/app_context/base_app_context.dart';

class EmulatorAppContext extends AppContext {
  EmulatorAppContext({bool allowDynamicLink = true})
      : super(allowDynamicLink: allowDynamicLink);

  @override
  bool needRemoteConfig() {
    return false;
  }

  @override
  bool needFirebase() {
    return true;
  }
}

import 'package:iwfpapp/services/app_context/base_app_context.dart';

class ProdAppContext extends AppContext {
  ProdAppContext({bool allowDynamicLink = true})
      : super(allowDynamicLink: allowDynamicLink);

  @override
  bool needRemoteConfig() {
    return true;
  }

  @override
  bool needFirebase() {
    return true;
  }
}

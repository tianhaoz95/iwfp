import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/app_context/base_app_context.dart';

class ProdAppContext extends AppContext {
  ProdAppContext({bool allowDynamicLink = true})
      : super(allowDynamicLink: allowDynamicLink);

  @override
  bool needRemoteConfig() {
    if (kIsWeb) {
      return false;
    }
    return true;
  }

  @override
  bool needFirebase() {
    return true;
  }
}

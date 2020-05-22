import 'package:iwfpapp/services/app_context/base_app_context.dart';
import 'package:iwfpapp/services/app_context/mock_app_context.dart';
import 'package:iwfpapp/services/app_context/prod_app_context.dart';
import 'package:iwfpapp/services/config/typedefs/app_context_types.dart';

AppContext getAppContext(AppContextType type, {bool allowDynamicLink = true}) {
  switch (type) {
    case AppContextType.PROD:
      return ProdAppContext(allowDynamicLink: allowDynamicLink);
    case AppContextType.MOCK:
      return MockAppContext(allowDynamicLink: allowDynamicLink);
    default:
      return ProdAppContext(allowDynamicLink: allowDynamicLink);
  }
}

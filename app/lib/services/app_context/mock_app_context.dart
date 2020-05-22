import 'package:iwfpapp/services/app_context/base_app_context.dart';

class MockAppContext extends AppContext {
  MockAppContext({bool allowDynamicLink = true})
      : super(allowDynamicLink: allowDynamicLink);
}

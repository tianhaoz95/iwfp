import 'package:iwfpapp/app/start_app.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';
import 'package:iwfpapp/services/config/typedefs/app_context_types.dart';
import 'package:iwfpapp/services/config/typedefs/app_theme_types.dart';
import 'package:iwfpapp/services/config/typedefs/backend.dart';

void main() {
  startApp(
    appAuthType: AppAuthType.MOCK_AUTH,
    backendType: BackendType.EMULATOR,
    appThemeType: AppThemeType.MOCK,
    appContextType: AppContextType.MOCK,
    shouldReportDevCrashes: false,
    allowDynamicLink: false,
  );
}

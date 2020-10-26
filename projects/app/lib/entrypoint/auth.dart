import 'package:iwfpapp/app/start_app.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';
import 'package:iwfpapp/services/config/typedefs/app_context_types.dart';
import 'package:iwfpapp/services/config/typedefs/app_theme_types.dart';
import 'package:iwfpapp/services/config/typedefs/backend.dart';

void main() {
  startApp(
    appAuthType: AppAuthType.FIREBASE_AUTH,
    backendType: BackendType.MOCK,
    appThemeType: AppThemeType.MOCK,
    appContextType: AppContextType.PROD,
    allowDynamicLink: false,
    shouldReportDevCrashes: false,
  );
}

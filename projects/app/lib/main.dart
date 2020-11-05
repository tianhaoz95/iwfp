import 'package:iwfpapp/app/start_app.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';
import 'package:iwfpapp/services/config/typedefs/backend.dart';

void main() {
  startApp(
    appAuthType: AppAuthType.FIREBASE_AUTH,
    backendType: BackendType.HTTP,
    shouldReportDevCrashes: false,
  );
}

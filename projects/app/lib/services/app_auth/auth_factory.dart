import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/app_auth/dumb_auth.dart';
import 'package:iwfpapp/services/app_auth/firebase_auth.dart';
import 'package:iwfpapp/services/app_auth/firebase_emulator_auth.dart';
import 'package:iwfpapp/services/app_auth/mock_auth.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';

AppAuth getAppAuth(AppAuthType type) {
  switch (type) {
    case AppAuthType.FIREBASE_AUTH:
      return AppAuthUsingFirebaseAuth();
    case AppAuthType.FIREBASE_EMULATOR:
      return AppAuthUsingFirebaseEmulator();
    case AppAuthType.MOCK_AUTH:
      return MockAuth();
    case AppAuthType.DUMB_AUTH:
      return DumbAuth();
    default:
      return AppAuthUsingFirebaseAuth();
  }
}

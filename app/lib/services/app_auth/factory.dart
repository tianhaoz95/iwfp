import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/app_auth/firebase.dart';
import 'package:iwfpapp/services/config/typedefs/app_auth_types.dart';

AppAuth getAppAuth(AppAuthType type) {
  switch (type) {
    case AppAuthType.FIREBASE_AUTH:
      return AppAuthUsingFirebaseAuth();
    default:
      return AppAuthUsingFirebaseAuth();
  }
}

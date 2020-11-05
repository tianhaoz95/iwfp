import 'package:iwfpapp/services/app_auth/firebase_auth.dart';

class AppAuthUsingFirebaseEmulator extends AppAuthUsingFirebaseAuth {
  @override
  Future<void> initialize() async {
    await super.initialize();
    // TODO(tianhaoz95): add useEmulator when flutter SDK adds it.
  }
}

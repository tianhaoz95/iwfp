import 'package:iwfpapp/services/config/typedefs/auth_status.dart';

abstract class AppAuth {
  Future<void> handleSignInWithEmail(String email, String pwd);

  Future<SignUpResponse> handleSignUpWithEmail(String email, String pwd);

  Future<void> handleSignOut();

  Future<bool> isSignedIn();

  Future<SendPasswordResetEmailResponse> handleSendPasswordResetEmail(
      String email);

  Future<String> generateToken();

  Future<String> getEmail();
}

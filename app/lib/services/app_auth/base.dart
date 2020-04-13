import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/config/typedefs/auth_states.dart';
import 'package:iwfpapp/services/config/typedefs/auth_status.dart';

abstract class AppAuth extends ChangeNotifier {
  AuthState authState;

  AppAuth() {
    authState = AuthState.NOT_SIGNED_IN;
  }

  AuthState getAuthState() {
    return authState;
  }

  Future<void> signInWithEmail(String email, String pwd) async {
    try {
      authState = AuthState.LOADING;
      notifyListeners();
      await signInWithEmailHandler(email, pwd);
      authState = AuthState.SIGNED_IN;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      authState = AuthState.ERROR;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      authState = AuthState.LOADING;
      notifyListeners();
      await signOutHandler();
      authState = AuthState.NOT_SIGNED_IN;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      authState = AuthState.ERROR;
      notifyListeners();
    }
  }

  void clearAuthState() {
    if (authState == AuthState.ERROR) {
      authState = AuthState.NOT_SIGNED_IN;
      notifyListeners();
    } else {
      print('auth state is not error, nothing to recover');
    }
  }

  Future<void> signInWithEmailHandler(String email, String pwd);

  Future<SignUpResponse> handleSignUpWithEmail(String email, String pwd);

  Future<void> signOutHandler();

  Future<bool> isSignedIn();

  Future<SendPasswordResetEmailResponse> handleSendPasswordResetEmail(
      String email);

  Future<String> generateToken();

  Future<String> getEmail();
}

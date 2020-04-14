import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/config/typedefs/auth_states.dart';
import 'package:iwfpapp/services/config/typedefs/reset_email_states.dart';

abstract class AppAuth extends ChangeNotifier {
  AuthState authState;
  ResetEmailState resetEmailState;

  AppAuth() {
    authState = AuthState.NOT_SIGNED_IN;
    resetEmailState = ResetEmailState.PENDING;
  }

  AuthState getAuthState() {
    return authState;
  }

  ResetEmailState getResetEmailState() {
    return resetEmailState;
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

  Future<void> signOut({bool silent = false}) async {
    try {
      authState = AuthState.LOADING;
      if (!silent) {
        notifyListeners();
      }
      await signOutHandler();
      authState = AuthState.NOT_SIGNED_IN;
      if (!silent) {
        notifyListeners();
      }
    } catch (err) {
      print(err.toString());
      authState = AuthState.ERROR;
      if (!silent) {
        notifyListeners();
      }
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

  Future<bool> isSignedIn() async {
    bool isSignedIn = await isSignedInHandler();
    if (isSignedIn) {
      authState = AuthState.SIGNED_IN;
    } else {
      authState = AuthState.NOT_SIGNED_IN;
    }
    return isSignedIn;
  }

  Future<void> signUpWithEmail(
      String email, String pwd, String pwdConfirm) async {
    if (pwd != pwdConfirm) {
      authState = AuthState.ERROR;
      notifyListeners();
    }
    try {
      authState = AuthState.LOADING;
      notifyListeners();
      await signUpWithEmailHandler(email, pwd);
      authState = AuthState.SIGNED_IN;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      authState = AuthState.ERROR;
      notifyListeners();
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      resetEmailState = ResetEmailState.SENDING;
      notifyListeners();
      await sendPasswordResetEmailHandler(email);
      resetEmailState = ResetEmailState.SENT;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      resetEmailState = ResetEmailState.ERROR;
      notifyListeners();
    }
  }

  Future<void> signInWithEmailHandler(String email, String pwd);

  Future<void> signUpWithEmailHandler(String email, String pwd);

  Future<void> signOutHandler();

  Future<bool> isSignedInHandler();

  Future<void> sendPasswordResetEmailHandler(String email);

  Future<String> generateToken();

  Future<String> getEmail();
}

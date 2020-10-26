import 'package:flutter/cupertino.dart';
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

  Future<void> signInWithGoogle() async {
    try {
      authState = AuthState.LOADING;
      notifyListeners();
      await signInWithGoogleHandler();
      authState = AuthState.SIGNED_IN;
      notifyListeners();
    } catch (err) {
      print(err.toString());
      authState = AuthState.ERROR;
      notifyListeners();
    }
  }

  Future<void> signInWithGitHub({BuildContext context}) async {
    try {
      authState = AuthState.LOADING;
      notifyListeners();
      await signInWithGitHubHandler(context: context);
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

  void setSignInState() {
    authState = AuthState.SIGNED_IN;
    notifyListeners();
  }

  void setSignOutState() {
    authState = AuthState.NOT_SIGNED_IN;
    notifyListeners();
  }

  Future<bool> isSignedIn() async {
    await Future.delayed(Duration(milliseconds: 200));
    return authState == AuthState.SIGNED_IN;
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

  void resetSendPasswordResetEmailState() {
    resetEmailState = ResetEmailState.PENDING;
  }

  Future<void> signInWithEmailHandler(String email, String pwd);

  Future<void> signInWithGoogleHandler();

  Future<void> signInWithGitHubHandler({BuildContext context});

  Future<void> signUpWithEmailHandler(String email, String pwd);

  Future<void> signOutHandler();

  Future<void> sendPasswordResetEmailHandler(String email);

  Future<String> generateToken();

  Future<String> getEmail();

  Future<void> initialize();
}

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;

class IwfpappAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResult authResult;
  FirebaseUser user;
  bool isAuthenticated = false;

  Future<bool> handleSignInWithEmail(String email, String pwd) async {
    try {
      authResult =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
    } catch (err) {
      developer.log(err.toString(), name: 'iwfpapp.auth.sign_in');
      isAuthenticated = false;
      return false;
    }
    user = authResult.user;
    isAuthenticated = true;
    return true;
  }

  bool isSignedIn() {
    return isAuthenticated;
  }
}

IwfpappAuth iwfpappAuth = IwfpappAuth();

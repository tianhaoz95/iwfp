import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;

class IwfpappAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResult authResult;

  Future<void> handleSignInWithEmail(String email, String pwd) async {
    try {
      authResult =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
    } catch (err) {
      developer.log(err.toString(), name: 'iwfpapp.services.auth.sign_in');
    }
  }

  Future<void> handleSignOut() async {
    if (_auth.currentUser() == null) {
      developer.log('not signed in, exit',
          name: 'iwfpapp.services.auth.sign_out');
    } else {
      try {
        developer.log('signing out...', name: 'iwfpapp.services.auth.sign_out');
        await _auth.signOut();
        developer.log('sign out completed',
            name: 'iwfpapp.services.auth.sign_out');
      } catch (err) {
        developer.log(err.toString(), name: 'iwfpapp.services.auth.sign_out');
      }
    }
  }

  Future<bool> isSignedIn() async {
    FirebaseUser user = await _auth.currentUser();
    if (user == null) {
      return false;
    }
    return true;
  }
}

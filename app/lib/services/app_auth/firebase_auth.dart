import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';

class AppAuthUsingFirebaseAuth extends AppAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthResult authResult;

  Future<void> signInWithEmailHandler(String email, String pwd) async {
    authResult =
        await _auth.signInWithEmailAndPassword(email: email, password: pwd);
  }

  Future<void> signInWithGoogleHandler() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential cred = GoogleAuthProvider.getCredential(
        idToken: googleAuth.accessToken, accessToken: googleAuth.idToken);
    authResult = await _auth.signInWithCredential(cred);
  }

  Future<void> signInWithGitHubHandler() async {
    AuthCredential cred =
        GithubAuthProvider.getCredential(token: 'cf66baec2260c0d635dd');
    authResult = await _auth.signInWithCredential(cred);
  }

  Future<void> signUpWithEmailHandler(String email, String pwd) async {
    AuthResult res =
        await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
    if (res.user == null) {
      throw 'whoops failed';
    }
  }

  Future<void> signOutHandler() async {
    if (_auth.currentUser() == null) {
      throw 'already_signed_out';
    } else {
      await _auth.signOut();
    }
  }

  Future<bool> isSignedInHandler() async {
    FirebaseUser user = await _auth.currentUser();
    if (kIsWeb && user == null) {
      user = await _auth.onAuthStateChanged.first;
    }
    if (user == null) {
      return false;
    }
    return true;
  }

  Future<void> sendPasswordResetEmailHandler(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<String> generateToken() async {
    FirebaseUser user = await _auth.currentUser();
    IdTokenResult tokenResult = await user.getIdToken();
    String token = tokenResult.token;
    return token;
  }

  Future<String> getEmail() async {
    FirebaseUser user = await _auth.currentUser();
    String email = user.email;
    return email;
  }
}

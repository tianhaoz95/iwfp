import 'package:firebase_auth/firebase_auth.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'dart:developer' as developer;

import 'package:iwfpapp/services/config/typedefs/auth_status.dart';

class AppAuthUsingFirebaseAuth extends AppAuth {
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

  Future<SignUpResponse> handleSignUpWithEmail(String email, String pwd) async {
    SignUpResponse authResponse = SignUpResponse(SignUpStatus.UNKNOWN, 'na');
    try {
      AuthResult res = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      if (res.user != null) {
        authResponse.status = SignUpStatus.SUCCESS;
      } else {
        authResponse.status = SignUpStatus.FAIL;
        authResponse.msg = 'Returned user is null';
      }
    } catch (err) {
      authResponse.status = SignUpStatus.UNKNOWN;
      authResponse.msg = err.toString();
    }
    return authResponse;
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

  Future<SendPasswordResetEmailResponse> handleSendPasswordResetEmail(
      String email) async {
    SendPasswordResetEmailResponse response =
        SendPasswordResetEmailResponse(AuthStatus.SUCCESS);
    try {
      await _auth.sendPasswordResetEmail(email: email);
      response.status = AuthStatus.SUCCESS;
    } catch (err) {
      response.status = AuthStatus.FAIL;
    }
    return response;
  }
}

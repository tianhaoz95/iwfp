import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'dart:developer' as developer;

import 'package:iwfpapp/services/config/typedefs/auth_status.dart';

class AppAuthUsingFirebaseAuth extends AppAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthResult authResult;

  Future<void> signInWithEmailHandler(String email, String pwd) async {
    authResult = await _auth.signInWithEmailAndPassword(email: email, password: pwd);
  }

  Future<void> signUpWithEmailHandler(String email, String pwd) async {
    AuthResult res = await _auth.createUserWithEmailAndPassword(
        email: email, password: pwd);
    if (res.user == null) {
      throw 'whoops failed';
    }
  }

  Future<void> signOutHandler() async {
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

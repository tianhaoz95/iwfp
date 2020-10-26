import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';

class AppAuthUsingFirebaseAuth extends AppAuth {
  FirebaseAuth _auth;
  GoogleSignIn _googleSignIn;
  UserCredential authResult;
  User _currentUser;

  @override
  Future<void> initialize() async {
    _auth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
    _auth.authStateChanges().listen((User user) {
      _currentUser = user;
      if (user == null) {
        setSignOutState();
      } else {
        setSignInState();
      }
    });
  }

  @override
  Future<void> signInWithEmailHandler(String email, String pwd) async {
    authResult =
        await _auth.signInWithEmailAndPassword(email: email, password: pwd);
  }

  @override
  Future<void> signInWithGoogleHandler() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential cred = GoogleAuthProvider.credential(
        idToken: googleAuth.accessToken, accessToken: googleAuth.idToken);
    authResult = await _auth.signInWithCredential(cred);
  }

  @override
  Future<void> signInWithGitHubHandler({BuildContext context}) async {
    if (kIsWeb) {
      GithubAuthProvider githubProvider = GithubAuthProvider();
      await FirebaseAuth.instance.signInWithPopup(githubProvider);
    } else {
      final String clientId = String.fromEnvironment('GITHUB_AUTH_CLIENT_ID');
      final String clientSecret =
          String.fromEnvironment('GITHUB_AUTH_CLIENT_SECRET');
      final GitHubSignIn gitHubSignIn = GitHubSignIn(
          clientId: clientId,
          clientSecret: clientSecret,
          redirectUrl: 'https://iwfpapp.firebaseapp.com/__/auth/handler');
      if (context != null) {
        final result = await gitHubSignIn.signIn(context);
        final AuthCredential githubAuthCredential =
            GithubAuthProvider.credential(result.token);
        final UserCredential cred = await FirebaseAuth.instance
            .signInWithCredential(githubAuthCredential);
        print(cred.user.displayName);
      } else {
        print('Context not found (required for mobile).');
      }
    }
  }

  @override
  Future<void> signUpWithEmailHandler(String email, String pwd) async {
    UserCredential res =
        await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
    if (res.user == null) {
      throw 'whoops failed';
    }
  }

  @override
  Future<void> signOutHandler() async {
    bool signedIn = await isSignedIn();
    if (!signedIn) {
      throw 'already_signed_out';
    } else {
      await _auth.signOut();
    }
  }

  @override
  Future<void> sendPasswordResetEmailHandler(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<String> generateToken() async {
    String token = await _currentUser.getIdToken();
    return token;
  }

  @override
  Future<String> getEmail() async {
    String email = _currentUser.email;
    return email;
  }
}

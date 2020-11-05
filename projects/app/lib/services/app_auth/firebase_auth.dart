import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';

class AppAuthUsingFirebaseAuth extends AppAuth {
  FirebaseAuth authProvider;
  GoogleSignIn _googleSignIn;
  UserCredential authResult;
  User _currentUser;

  @override
  Future<void> initialize() async {
    authProvider = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
    authProvider.authStateChanges().listen((User user) {
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
    authResult = await authProvider.signInWithEmailAndPassword(
        email: email, password: pwd);
  }

  @override
  Future<void> signInWithGoogleHandler() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential cred = GoogleAuthProvider.credential(
        idToken: googleAuth.accessToken, accessToken: googleAuth.idToken);
    authResult = await authProvider.signInWithCredential(cred);
  }

  @override
  Future<void> signInWithGitHubHandler({BuildContext context}) async {
    if (kIsWeb) {
      GithubAuthProvider githubProvider = GithubAuthProvider();
      githubProvider.addScope('repo');
      githubProvider.setCustomParameters({
        'allow_signup': 'true',
      });
      await FirebaseAuth.instance.signInWithPopup(githubProvider);
    } else {
      const String clientId = String.fromEnvironment('GITHUB_AUTH_CLIENT_ID');
      const String clientSecret =
          String.fromEnvironment('GITHUB_AUTH_CLIENT_SECRET');
      if (clientId.isEmpty || clientSecret.isEmpty) {
        print('GitHub Oauth client ID or secret is empty.');
        throw ('GitHub Oauth credential not found.');
      }
      print('Use ID ${clientId} and secret ${clientSecret}');
      final GitHubSignIn gitHubSignIn = GitHubSignIn(
          clientId: clientId,
          clientSecret: clientSecret,
          scope: 'repo,user,gist,user:email',
          allowSignUp: true,
          redirectUrl: 'https://iwfpapp.firebaseapp.com/__/auth/handler');
      if (context != null) {
        final result = await gitHubSignIn.signIn(context);
        final AuthCredential githubAuthCredential =
            GithubAuthProvider.credential(result.token);
        final UserCredential cred = await FirebaseAuth.instance
            .signInWithCredential(githubAuthCredential);
        print('Signed in user with id ${cred.user.displayName} using GitHub');
      } else {
        print('Context not found (required for mobile).');
      }
    }
  }

  @override
  Future<void> signUpWithEmailHandler(String email, String pwd) async {
    UserCredential res = await authProvider.createUserWithEmailAndPassword(
        email: email, password: pwd);
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
      await authProvider.signOut();
    }
  }

  @override
  Future<void> sendPasswordResetEmailHandler(String email) async {
    await authProvider.sendPasswordResetEmail(email: email);
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

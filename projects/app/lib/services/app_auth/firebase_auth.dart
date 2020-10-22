import 'package:firebase_auth/firebase_auth.dart';
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
  Future<void> signInWithGitHubHandler() async {
    AuthCredential cred = GithubAuthProvider.credential('cf66baec2260c0d635dd');
    authResult = await _auth.signInWithCredential(cred);
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

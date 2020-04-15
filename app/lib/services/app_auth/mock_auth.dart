import 'package:iwfpapp/services/app_auth/base_auth.dart';

class MockAuth extends AppAuth {
  Map<String, String> users;
  bool signedIn;

  MockAuth() : super() {
    users = {};
    signedIn = false;
  }

  @override
  Future<String> generateToken() async {
    await Future.delayed(Duration(milliseconds: 200));
    return 'mock_token';
  }

  @override
  Future<String> getEmail() async {
    await Future.delayed(Duration(milliseconds: 200));
    return 'test@test.com';
  }

  @override
  Future<bool> isSignedInHandler() async {
    await Future.delayed(Duration(milliseconds: 200));
    return signedIn;
  }

  @override
  Future<void> sendPasswordResetEmailHandler(String email) async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> signInWithEmailHandler(String email, String pwd) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (users.containsKey(email) && users[email] == pwd) {
      signedIn = true;
    } else {
      throw 'sign_in_failed';
    }
  }

  @override
  Future<void> signOutHandler() async {
    await Future.delayed(Duration(milliseconds: 200));
    signedIn = false;
  }

  @override
  Future<void> signUpWithEmailHandler(String email, String pwd) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (users.containsKey(email)) {
      throw 'email_exist';
    } else {
      users[email] = pwd;
    }
  }
}

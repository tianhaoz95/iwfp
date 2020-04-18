import 'package:iwfpapp/services/app_auth/base_auth.dart';

class DumbAuth extends AppAuth {
  @override
  Future<String> generateToken() async {
    await Future.delayed(Duration(milliseconds: 200));
    return 'dumb_token';
  }

  @override
  Future<String> getEmail() async {
    await Future.delayed(Duration(milliseconds: 200));
    return 'dumb@dumb.com';
  }

  @override
  Future<bool> isSignedInHandler() async {
    await Future.delayed(Duration(milliseconds: 200));
    return true;
  }

  @override
  Future<void> sendPasswordResetEmailHandler(String email) async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> signInWithEmailHandler(String email, String pwd) async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> signOutHandler() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  @override
  Future<void> signUpWithEmailHandler(String email, String pwd) async {
    await Future.delayed(Duration(milliseconds: 200));
  }
}

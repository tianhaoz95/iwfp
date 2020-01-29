import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/services/config/typedefs/auth_status.dart';
import 'package:iwfpapp/services/config/typedefs/user_account.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/mock_accounts.dart';

class MockAppAuth extends Mock implements AppAuth {
  List<UserAccount> accounts = [];
  bool mockedIsSignedIn = false;
  UserAccount currentUser =
      UserAccount(email: 'wtf@iwfpapp.com', password: 'wtf#12345');
  @override
  MockAppAuth({UserAccount overrideUser}) {
    accounts = mockedAccounts;
    mockedIsSignedIn = false;
    if (overrideUser != null) {
      mockedIsSignedIn = true;
      accounts.add(overrideUser);
      currentUser = overrideUser;
    }
  }
  @override
  Future<SignUpResponse> handleSignUpWithEmail(String email, String pwd) async {
    SignUpResponse response = SignUpResponse(SignUpStatus.SUCCESS, 'Mocked');
    bool shouldAdd = true;
    for (UserAccount account in accounts) {
      if (account.email == email) {
        response.status = SignUpStatus.FAIL;
        response.msg = 'Account exist';
        shouldAdd = false;
        break;
      }
    }
    if (shouldAdd) {
      UserAccount signUpUser = UserAccount(email: email, password: pwd);
      accounts.add(signUpUser);
    }
    return Future.delayed(Duration(seconds: 1), () => response);
  }

  @override
  Future<void> handleSignInWithEmail(String email, String pwd) async {
    for (UserAccount account in accounts) {
      if (account.email == email && account.password == pwd) {
        mockedIsSignedIn = true;
        currentUser = account;
        break;
      }
    }
    return Future.delayed(Duration(seconds: 1), () => {});
  }

  @override
  Future<bool> isSignedIn() async {
    return Future.delayed(Duration(seconds: 1), () => mockedIsSignedIn);
  }
}

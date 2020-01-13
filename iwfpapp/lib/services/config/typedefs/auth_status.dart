enum SignUpStatus {
  SUCCESS,
  FAIL,
  UNKNOWN,
}

class SignUpResponse {
  SignUpStatus status;
  String msg;
  SignUpResponse(this.status, this.msg);
}

enum AuthStatus {
  SUCCESS,
  FAIL,
  UNKNOWN,
}

class SendPasswordResetEmailResponse {
  AuthStatus status;
  SendPasswordResetEmailResponse(this.status);
}

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

enum ResponseStatus {
  SUCCEESS,
  FAILURE,
}

class CloudFuncResponse {
  ResponseStatus status;
  String msg;
  CloudFuncResponse(this.status, this.msg);
}
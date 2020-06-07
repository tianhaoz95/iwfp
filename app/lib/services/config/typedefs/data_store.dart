/// The data fetching status
enum DataBackendStatus { LOADING, AVAILABLE, OUTDATED, ERROR }

/// The stages in deleting an account
/// TODO(#453): merge this with [DataBackendStatus]
enum DeleteAccountStatus {
  PENDING,
  DELETEING,
  DELETED,
  ERROR,
}

enum DataBackendType {
  IN_APP,
  HTTPS,
}

enum ResponseStatus {
  SUCCEESS,
  FAILURE,
}

class BackendResponse {
  ResponseStatus status;
  String msg;
  BackendResponse(this.status, this.msg);
}

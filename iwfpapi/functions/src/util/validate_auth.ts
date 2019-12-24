import * as functions from "firebase-functions";

function isValidAuth(
  context: functions.https.CallableContext,
  isEmulator: string | undefined
): boolean {
  if (isEmulator) {
    return true;
  } else {
    if (context.auth) {
      return true;
    } else {
      return false;
    }
  }
}

export default isValidAuth;

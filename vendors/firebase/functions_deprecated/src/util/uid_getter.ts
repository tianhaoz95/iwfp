import * as functions from "firebase-functions";
import { UnknownUserError } from "../config/errors";

function getUserUid(
  context: functions.https.CallableContext,
  isEmulator: string | undefined
): string {
  if (isEmulator) {
    return "test_user";
  } else {
    if (context.auth !== undefined) {
      if (context.auth.uid !== undefined) {
        return context.auth.uid;
      } else {
        throw UnknownUserError;
      }
    } else {
      throw UnknownUserError;
    }
  }
}

export default getUserUid;

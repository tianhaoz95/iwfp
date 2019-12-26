import isValidAuth from "../util/validate_auth";
import { UnauthenticatedUserError } from "../config/errors";
import getUserUid from "../util/uid_getter";

async function removeUserHandler(data, context, provider) {
  if (isValidAuth(context.auth, process.env.FUNCTIONS_EMULATOR)) {
    const userUid: string = getUserUid(context, process.env.FUNCTIONS_EMULATOR);
    await provider.removeUser(userUid);
  } else {
    throw UnauthenticatedUserError;
  }
}

export default removeUserHandler;
import { UnauthenticatedUserError } from "../config/errors";
import { FunctionContext } from "../config/typedefs";

async function removeUserHandler(data, context: FunctionContext, provider) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    await userRef.delete();
    await provider.removeUser(userUid);
  } else {
    throw UnauthenticatedUserError;
  }
}

export default removeUserHandler;

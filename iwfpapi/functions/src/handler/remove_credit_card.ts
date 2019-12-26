import { noAuthMsg } from "../config/consts";
import getUserUid from "../util/uid_getter";
import isValidAuth from "../util/validate_auth";

async function removeCreditCardHandler(data, context, provider) {
  if (isValidAuth(context, process.env.FUNCTIONS_EMULATOR)) {
    const userUid: string = getUserUid(context, process.env.FUNCTIONS_EMULATOR);
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.cardUid);
    await cardRef.delete();
  } else {
    throw noAuthMsg;
  }
}

export default removeCreditCardHandler;

import { noAuthMsg } from "../config/consts";
import getUserUid from "../util/uid_getter";
import isValidAuth from "../util/validate_auth";
import { CardRemovalRequest } from "../config/typedefs";

async function removeCreditCardHandler(data: CardRemovalRequest, context, provider) {
  if (isValidAuth(context, process.env.FUNCTIONS_EMULATOR)) {
    const userUid: string = getUserUid(context, process.env.FUNCTIONS_EMULATOR);
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.id);
    await cardRef.delete();
  } else {
    throw noAuthMsg;
  }
}

export default removeCreditCardHandler;

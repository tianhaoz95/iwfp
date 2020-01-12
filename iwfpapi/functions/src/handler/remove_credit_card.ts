import { noAuthMsg } from "../config/consts";
import getUserUid from "../util/uid_getter";
import isValidAuth from "../util/validate_auth";
import { CardRemovalRequest } from "../config/typedefs";
import { CardForDeletionNotExist } from "../config/errors";

async function removeCreditCardHandler(
  data: CardRemovalRequest,
  context,
  provider
) {
  if (isValidAuth(context, process.env.FUNCTIONS_EMULATOR)) {
    const userUid: string = getUserUid(context, process.env.FUNCTIONS_EMULATOR);
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.id);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      await cardRef.delete();
    } else {
      throw CardForDeletionNotExist;
    }
  } else {
    throw noAuthMsg;
  }
}

export default removeCreditCardHandler;

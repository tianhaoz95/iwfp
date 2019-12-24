import { noAuthMsg } from "../config/consts";
import { CreditCardIdConflictError } from "../config/errors";
import getUserUid from "../util/uid_getter";
import isValidAuth from "../util/validate_auth";

async function addCreditCardHandler(data, context, provider) {
  if (isValidAuth(context.auth, process.env.FUNCTIONS_EMULATOR)) {
    const userUid: string = getUserUid(context, process.env.FUNCTIONS_EMULATOR);
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.cardUid);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      throw CreditCardIdConflictError;
    } else {
      const cardName: string = data.cardData;
      const status = await cardRef.set({ card_name: cardName });
      return status;
    }
  } else {
    throw noAuthMsg;
  }
}

export default addCreditCardHandler;

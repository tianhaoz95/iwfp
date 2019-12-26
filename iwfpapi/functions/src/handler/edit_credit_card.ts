import { noAuthMsg, creditCardNotExistError } from "../config/consts";
import getUserUid from "../util/uid_getter";
import isValidAuth from "../util/validate_auth";

async function editCreditCardHandler(data, context, provider) {
  if (isValidAuth(context, process.env.FUNCTIONS_EMULATOR)) {
    const userUid: string = getUserUid(context, process.env.FUNCTIONS_EMULATOR);
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.cardUid);
    const cardSnap = await cardRef.get();
    if (!cardSnap.exists) {
      throw creditCardNotExistError;
    } else {
      const creditCardName: string = data.cardData;
      await cardRef.set({
        card_name: creditCardName
      });
    }
  } else {
    throw noAuthMsg;
  }
}

export default editCreditCardHandler;

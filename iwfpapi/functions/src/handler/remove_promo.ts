import { noAuthMsg, creditCardNotExistError } from "../config/consts";
import { PromoNotExistError } from "../config/errors";
import getUserUid from "../util/uid_getter";
import isValidAuth from "../util/validate_auth";

async function removePromoHandler(data, context, provider) {
  if (isValidAuth(context, process.env.FUNCTIONS_EMULATOR)) {
    const userUid: string = getUserUid(context, process.env.FUNCTIONS_EMULATOR);
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.cardUid);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      const promoId: string = data.promoId;
      const promoRef = cardRef.collection("promos").doc(promoId);
      const promoSnap = await promoRef.get();
      if (promoSnap.exists) {
        await promoRef.delete();
      } else {
        throw PromoNotExistError;
      }
    } else {
      throw creditCardNotExistError;
    }
  } else {
    throw noAuthMsg;
  }
}

export default removePromoHandler;

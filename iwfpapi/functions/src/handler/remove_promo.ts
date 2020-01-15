import { noAuthMsg, creditCardNotExistError } from "../config/consts";
import { PromoNotExistError } from "../config/errors";
import { FunctionContext, RemovePromoRequest } from "../config/typedefs";

async function removePromoHandler(
  data: RemovePromoRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.card);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      const promoId: string = data.promo;
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

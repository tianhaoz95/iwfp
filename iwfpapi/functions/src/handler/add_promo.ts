import {
  noAuthMsg,
  creditCardNotExistError,
  promoAlreadyExistError
} from "../config/consts";
import isValidAuth from "../util/validate_auth";
import getUserUid from "../util/uid_getter";

async function addPromoHandler(data, context, provider) {
  if (isValidAuth(context.auth, process.env.FUNCTIONS_EMULATOR)) {
    const userUid: string = getUserUid(context, process.env.FUNCTIONS_EMULATOR);
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.cardUid);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      const promoId: string = data.promoId;
      const promoRef = cardRef.collection("promos").doc(promoId);
      const promoSnap = await promoRef.get();
      if (promoSnap.exists) {
        throw promoAlreadyExistError;
      } else {
        const promoName: string = data.promoName;
        const promoType: string = data.promoType;
        const promoStart: string = data.promoStart;
        const promoEnd: string = data.promoEnd;
        const promoRepeat: string = data.promoRepeat;
        const promoRate: string = data.promoRate;
        const promoCategoryId: string = data.promoCategoryId;
        const promoCategoryName: string = data.promoCategoryName;
        await promoRef.set({
          promo_name: promoName,
          promo_id: promoId,
          promo_type: promoType,
          promo_start: promoStart,
          promo_end: promoEnd,
          promo_repeat_pattern: promoRepeat,
          promo_rate: promoRate,
          promo_category_id: promoCategoryId,
          promo_category_name: promoCategoryName
        });
      }
    } else {
      throw creditCardNotExistError;
    }
  } else {
    throw noAuthMsg;
  }
}

export default addPromoHandler;

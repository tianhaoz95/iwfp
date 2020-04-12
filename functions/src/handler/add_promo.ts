import {
  noAuthMsg,
  creditCardNotExistError,
  promoAlreadyExistError,
} from "../config/consts";
import { FunctionContext, AddPromoRequest } from "../config/typedefs";

async function addPromoHandler(
  data: AddPromoRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.card);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      const promoId: string = data.promo.id;
      const promoRef = cardRef.collection("promos").doc(promoId);
      const promoSnap = await promoRef.get();
      if (promoSnap.exists) {
        throw promoAlreadyExistError;
      } else {
        const promoName: string = data.promo.name;
        const promoType: string = data.promo.type;
        const promoStart: string = data.promo.start;
        const promoEnd: string = data.promo.end;
        const promoRepeat: string = data.promo.repeat;
        const promoRate: string = data.promo.rate;
        const promoCategoryId: string = data.promo.category.id;
        const promoCategoryName: string = data.promo.category.name;
        await promoRef.set({
          promo_name: promoName,
          promo_id: promoId,
          promo_type: promoType,
          promo_start: promoStart,
          promo_end: promoEnd,
          promo_repeat_pattern: promoRepeat,
          promo_rate: promoRate,
          promo_category_id: promoCategoryId,
          promo_category_name: promoCategoryName,
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

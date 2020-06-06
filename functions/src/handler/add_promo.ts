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
        // TODO(tianhaoz): consoildate the logging into a separate
        // function for better reusability.
        console.log(
          "Cannot add " +
            promoId +
            " to " +
            data.card +
            ", because it already exists."
        );
        throw promoAlreadyExistError;
      } else {
        const promoName: string = data.promo.displayName;
        const promoType: string = data.promo.type;
        const promoStart: string = data.promo.startDate;
        const promoEnd: string = data.promo.endDate;
        const promoRepeat: string = data.promo.repeatPattern;
        const promoRate: number = data.promo.rate;
        const promoCategoryId: string =
          data.promo.category && data.promo.category.id
            ? data.promo.category.id
            : "unknwon";
        const promoCategoryName: string =
          data.promo.category && data.promo.category.displayName
            ? data.promo.category.displayName
            : "unknown";
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

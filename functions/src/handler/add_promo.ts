import {
  noAuthMsg,
  creditCardNotExistError,
  promoAlreadyExistError,
} from "../config/consts";
import { FunctionContext } from "../config/typedefs";
import { PromotionAdditionRequest } from "../interfaces/interfaces";

async function addPromoHandler(
  data: PromotionAdditionRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.targetCardId);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      const promoId: string =
        data.promotionData && data.promotionData.id
          ? data.promotionData.id
          : "na";
      const promoRef = cardRef.collection("promos").doc(promoId);
      const promoSnap = await promoRef.get();
      if (promoSnap.exists) {
        // TODO(tianhaoz): consoildate the logging into a separate
        // function for better reusability.
        console.log(
          "Cannot add " +
            promoId +
            " to " +
            data.targetCardId +
            ", because it already exists."
        );
        throw promoAlreadyExistError;
      } else {
        const promoName: string =
          data.promotionData && data.promotionData.displayName
            ? data.promotionData.displayName
            : "na";
        const promoType: string =
          data.promotionData && data.promotionData.type
            ? data.promotionData.type
            : "na";
        const promoStart: string =
          data.promotionData && data.promotionData.startDate
            ? data.promotionData.startDate
            : "na";
        const promoEnd: string =
          data.promotionData && data.promotionData.endDate
            ? data.promotionData.endDate
            : "na";
        const promoRepeat: string =
          data.promotionData && data.promotionData.repeatPattern
            ? data.promotionData.repeatPattern
            : "na";
        const promoRate: number =
          data.promotionData && data.promotionData.rate
            ? data.promotionData.rate
            : 0;
        const promoCategoryId: string =
          data.promotionData &&
          data.promotionData.category &&
          data.promotionData.category.id
            ? data.promotionData.category.id
            : "na";
        const promoCategoryName: string =
          data.promotionData &&
          data.promotionData.category &&
          data.promotionData.category.displayName
            ? data.promotionData.category.displayName
            : "na";
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

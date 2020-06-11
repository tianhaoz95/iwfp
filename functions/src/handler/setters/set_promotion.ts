import { Promotion } from "../../interfaces/interfaces";
import Provider from "../../provider";
import {
  creditCardNotExistError,
  promoAlreadyExistError,
} from "../../config/consts";

export async function setPromotion(
  userId: string,
  targetCardId: string,
  promotion: Promotion,
  provider: Provider
) {
  const userRef = provider.getUserRef(userId);
  const cardRef = userRef.collection("cards").doc(targetCardId);
  const cardSnap = await cardRef.get();
  if (cardSnap.exists) {
    const promoId: string = promotion.id ? promotion.id : "na";
    const promoRef = cardRef.collection("promos").doc(promoId);
    const promoSnap = await promoRef.get();
    if (promoSnap.exists) {
      // TODO(tianhaoz): consoildate the logging into a separate
      // function for better reusability.
      console.log(
        "Cannot add " +
          promoId +
          " to " +
          targetCardId +
          ", because it already exists."
      );
      throw promoAlreadyExistError;
    } else {
      const promoName: string = promotion.displayName
        ? promotion.displayName
        : "na";
      const promoType: string = promotion.type ? promotion.type : "na";
      const promoStart: string = promotion.startDate
        ? promotion.startDate
        : "na";
      const promoEnd: string = promotion.endDate ? promotion.endDate : "na";
      const promoRepeat: string = promotion.repeatPattern
        ? promotion.repeatPattern
        : "na";
      const promoRate: number = promotion.rate ? promotion.rate : 0;
      const promoCategoryId: string =
        promotion.category && promotion.category.id
          ? promotion.category.id
          : "na";
      const promoCategoryName: string =
        promotion.category && promotion.category.displayName
          ? promotion.category.displayName
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
}

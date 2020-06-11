import { Promotion } from "../../interfaces/interfaces";
import Provider from "../../provider";
import {
  creditCardNotExistError,
  promoAlreadyExistError,
} from "../../config/consts";
import { PromotionIdMissingError } from "../../config/errors";

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
    if (promotion.id) {
      const promoRef = cardRef.collection("promos").doc(promotion.id);
      const promoSnap = await promoRef.get();
      if (promoSnap.exists) {
        throw promoAlreadyExistError;
      } else {
        await promoRef.set(promotion.toJSON());
      }
    } else {
      throw PromotionIdMissingError;
    }
  } else {
    throw creditCardNotExistError;
  }
}

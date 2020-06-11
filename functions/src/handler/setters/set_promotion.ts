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
      await promoRef.set(promotion.toJSON());
    }
  } else {
    throw creditCardNotExistError;
  }
}

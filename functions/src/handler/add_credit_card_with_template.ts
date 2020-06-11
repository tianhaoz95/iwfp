import { noAuthMsg, requestDataIncomplete } from "../config/consts";
import { CreditCardIdConflictError } from "../config/errors";
import { FunctionContext } from "../config/typedefs";
import {
  CreditCardCreationRequest,
  Promotion,
  CreditCard,
} from "../interfaces/interfaces";
import { setPromotion } from "./setters/set_promotion";
import { setCreditCard } from "./setters/set_credit_card";

async function addCreditCardWithTemplateHandler(
  data: CreditCardCreationRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    if (data.cardData) {
      const userId: string = context.uid;
      const userRef = provider.getUserRef(userId);
      const cardRef = userRef.collection("cards").doc(data.cardData.id);
      const cardSnap = await cardRef.get();
      if (cardSnap.exists) {
        throw CreditCardIdConflictError;
      } else {
        await setCreditCard(userId, CreditCard.create(data.cardData), provider);
        if (data.cardData.promotions) {
          for (const promo of data.cardData.promotions) {
            // The loggings are here to check if there is a
            // race condition. It's not likely, but good to
            // know.
            console.log("start adding " + promo.id);
            if (data.cardData.id) {
              await setPromotion(
                userId,
                data.cardData.id,
                Promotion.create(promo),
                provider
              );
            }
            console.log("finished adding " + promo.id);
          }
        }
      }
    } else {
      throw requestDataIncomplete;
    }
  } else {
    throw noAuthMsg;
  }
}

export default addCreditCardWithTemplateHandler;

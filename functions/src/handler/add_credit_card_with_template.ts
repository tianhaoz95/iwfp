import { noAuthMsg, requestDataIncomplete } from "../config/consts";
import { CreditCardIdConflictError } from "../config/errors";
import { FunctionContext } from "../config/typedefs";
import addPromoHandler from "./add_promo";
import {
  CreditCardCreationRequest,
  PromotionAdditionRequest,
} from "../interfaces/interfaces";

async function addCreditCardWithTemplateHandler(
  data: CreditCardCreationRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    if (data.cardData) {
      const userUid: string = context.uid;
      const userRef = provider.getUserRef(userUid);
      const cardRef = userRef.collection("cards").doc(data.cardData.id);
      const cardSnap = await cardRef.get();
      if (cardSnap.exists) {
        throw CreditCardIdConflictError;
      } else {
        const cardName: string = data.cardData.displayName
          ? data.cardData.displayName
          : "na";
        const officialUrl: string = data.cardData?.officialUrl
          ? data.cardData?.officialUrl
          : "na";
        await cardRef.set({
          card_name: cardName,
          official_url: officialUrl,
        });
        if (data.cardData.promotions) {
          for (const promo of data.cardData.promotions) {
            // The loggings are here to check if there is a
            // race condition. It's not likely, but good to
            // know.
            console.log("start adding " + promo.id);
            await addPromoHandler(
              PromotionAdditionRequest.create({
                targetCardId: data.cardData.id,
                promotionData: promo,
              }),
              context,
              provider
            );
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

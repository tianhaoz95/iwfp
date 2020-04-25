import { noAuthMsg } from "../config/consts";
import { CreditCardIdConflictError } from "../config/errors";
import {
  FunctionContext,
  CardCreationWithTemplateRequest,
} from "../config/typedefs";
import addPromoHandler from "./add_promo";

async function addCreditCardWithTemplateHandler(
  data: CardCreationWithTemplateRequest,
  context: FunctionContext,
  provider
) {
  if (context.authenticated) {
    const userUid: string = context.uid;
    const userRef = provider.getUserRef(userUid);
    const cardRef = userRef.collection("cards").doc(data.id);
    const cardSnap = await cardRef.get();
    if (cardSnap.exists) {
      throw CreditCardIdConflictError;
    } else {
      const cardName: string = data.name;
      await cardRef.set({
        card_name: cardName,
      });
      for (const promo of data.promos) {
        // The loggings are here to check if there is a
        // race condition. It's not likely, but good to
        // know.
        console.log("start adding " + promo.promo.id);
        await addPromoHandler(promo, context, provider);
        console.log("finished adding" + promo.promo.id);
      }
      return;
    }
  } else {
    throw noAuthMsg;
  }
}

export default addCreditCardWithTemplateHandler;
